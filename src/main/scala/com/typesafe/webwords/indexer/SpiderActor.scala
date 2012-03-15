package com.typesafe.webwords.indexer

import java.io.File
import java.net.URI
import java.net.URL

import com.typesafe.webwords.common._

import akka.actor._
import akka.pattern.{ask, pipe}
import akka.util.Timeout
import akka.dispatch._
import akka.event.LoggingAdapter
import akka.routing.SmallestMailboxRouter._
import akka.routing.DefaultResizer._
import akka.routing.{DefaultResizer, SmallestMailboxRouter}

sealed trait SpiderRequest
case class Spider(url: URL) extends SpiderRequest

sealed trait SpiderReply
case class Spidered(url: URL, index: Index)

/**
 * This actor coordinates URLFetcher and IndexerActor actors in order
 * to do a shallow spider of a site and compute an "index" for the
 * site. An index is a list of word counts and a list of links found
 * on the site.
 *
 * There's some list processing in functional style in this file
 * that may be of interest if you're learning about Scala and
 * functional programming.
 */
class SpiderActor
    extends Actor with ActorLogging {

    // attempt at CPU-bound fan-out
    private val indexer = context.actorOf(Props[IndexerActor].withRouter(
        SmallestMailboxRouter(resizer = Option(DefaultResizer(
        // BoundedCapacitor: create between lowerBound and upperBound delegates in the pool
        lowerBound = 1,
        upperBound = Runtime.getRuntime().availableProcessors() * 2,
        // BasicRampup: rampupRate is percentage increase in capacity when all delegates are busy
        // make this very small to aim for just 1 more actor per needed connection
        rampupRate = 0.2,
        // BasicBackoff: backoffThreshold is the percentage-busy to drop below before
        // we reduce actor count
        backoffThreshold = 0.7,
        // BasicBackoff: backoffRate is the amount to back off when we are below backoffThreshold.
        // this one is intended to be less than 1.0-backoffThreshold so we keep some slack.
        backoffRate = 0.20
    )))), "indexer")

    private val fetcher = context.actorOf(Props[URLFetcher], "url-fetcher")

    override def receive = {
        case request: SpiderRequest => request match {
            case Spider(url) =>
                log.debug("Spider({})", url)
                import context.dispatcher
                SpiderActor.spider(indexer, fetcher, url, log) pipeTo sender
        }
    }
}

object SpiderActor {

    private def fetchBody(fetcher: ActorRef, url: URL, log: LoggingAdapter)(implicit context: ActorContext): Future[String] = {
        implicit val timeout = Timeout(context.system.settings.config.getMilliseconds("akka.timeout.default"))
        import context.dispatcher
        val fetched = fetcher ? FetchURL(url)
        // there may be a cleaner solution here than returning an empty
        // document on failure, but let's go with this for now
        val bodyFuture = new DefaultPromise[String]
        val maybeFailedFetch = fetched map {
            case URLFetched(status, headers, body) if status == 200 =>
                // FIXME should probably filter out non-HTML content types
                body
            case URLFetched(status, headers, body) =>
                throw new Exception("Failed to fetch, status: " + status)
            case whatever =>
                throw new IllegalStateException("Unexpected reply to url fetch: " + whatever)
        }
        maybeFailedFetch.onSuccess({ case x => bodyFuture.complete(Right(x)) })
        maybeFailedFetch.onFailure({
            case e =>
                log.info("Exception fetching '{}': {}: {}", url, e.getClass.getSimpleName, e.getMessage)
                // and just pretend we got an empty document.
                bodyFuture.complete(Right(""))
        })
        bodyFuture
    }

    private def fetchIndex(indexer: ActorRef, fetcher: ActorRef, url: URL, log: LoggingAdapter)(implicit context: ActorContext): Future[Index] = {
        implicit val timeout = Timeout(context.system.settings.config.getMilliseconds("akka.timeout.default"))
        fetchBody(fetcher, url, log) flatMap { body =>
            val indexed = indexer ? IndexHtml(url, body)
            indexed map {
                case IndexedHtml(index) =>
                    index

            }
        }
    }

    // pick a few links on the page to follow, preferring to "descend"
    private def childLinksToFollow(url: URL, index: Index): Seq[URL] = {
        val uri = removeFragment((url.toURI))
        val siteRoot = copyURI(uri, path = Some(null))
        val parentPath = new File(uri.getPath).getParent
        val parent = if (parentPath != null) copyURI(uri, path = Some(parentPath)) else siteRoot

        val sameSiteOnly = index.links map {
            kv => kv._2
        } map {
            new URI(_)
        } map {
            removeFragment(_)
        } filter {
            _ != uri
        } filter {
            isBelow(siteRoot, _)
        } sortBy {
            pathDepth(_)
        }
        val siblingsOrChildren = sameSiteOnly filter { isBelow(parent, _) }
        val children = siblingsOrChildren filter { isBelow(uri, _) }

        // prefer children, if not enough then siblings, if not enough then same site
        val toFollow = (children ++ siblingsOrChildren ++ sameSiteOnly).distinct take 10 map { _.toURL }
        toFollow
    }

    private[indexer] def combineSortedCounts(sortedA: List[(String, Int)], sortedB: List[(String, Int)]): List[(String, Int)] = {
        if (sortedA == Nil) {
            sortedB
        } else if (sortedB == Nil) {
            sortedA
        } else {
            val aHead = sortedA.head
            val bHead = sortedB.head
            val aWord = aHead._1
            val bWord = bHead._1

            if (aWord == bWord) {
                (aWord -> (aHead._2 + bHead._2)) :: combineSortedCounts(sortedA.tail, sortedB.tail)
            } else if (aWord < bWord) {
                aHead :: combineSortedCounts(sortedA.tail, sortedB)
            } else {
                bHead :: combineSortedCounts(sortedA, sortedB.tail)
            }
        }
    }

    private[indexer] def combineCounts(a: Seq[(String, Int)], b: Seq[(String, Int)]) = {
        combineSortedCounts(a.toList.sortBy(_._1), b.toList.sortBy(_._1)).sortBy(0 - _._2)
    }

    private[indexer] def mergeIndexes(a: Index, b: Index): Index = {
        val links = (a.links ++ b.links).sortBy(_._1).distinct

        // ideally we might combine and count length at the same time, but we'll live
        val counts = combineCounts(a.wordCounts, b.wordCounts).take(math.max(a.wordCounts.length, b.wordCounts.length))
        Index(links, counts)
    }

    private def combineIndexes(indexes: TraversableOnce[Index]): Index = {
        indexes.reduce(mergeIndexes(_, _))
    }

    /*
     * This is a relatively complex example of using Akka's Future class.
     * Note that this code never blocks (no future.await()
     * or future.get()), instead it uses map, flatMap, and friends
     * on the futures to chain them together. It then ultimately
     * returns a future that will be completed when all the dependent
     * futures are also completed.
     */
    private[indexer] def spider(indexer: ActorRef, fetcher: ActorRef, url: URL, log: LoggingAdapter)(implicit context: ActorContext): Future[Spidered] = {
        import context.dispatcher
        fetchIndex(indexer, fetcher, url, log) flatMap { rootIndex =>
            val childIndexes = childLinksToFollow(url, rootIndex) map { fetchIndex(indexer, fetcher, _, log) }
            val rootIndexFuture = Promise.successful(rootIndex)
            val allIndexFutures = childIndexes ++ Iterator(rootIndexFuture)
            val allIndexes = Future.sequence(allIndexFutures)
            val combinedIndex = allIndexes map { indexes =>
                combineIndexes(indexes)
            }
            val spidered = combinedIndex map { index =>
                Spidered(url, index)
            }

            spidered
        }
    }

    // this lets us copy URIs changing one part of the URI via keyword.
    private def copyURI(uri: URI, scheme: Option[String] = None, userInfo: Option[String] = None,
        host: Option[String] = None, port: Option[Int] = None, path: Option[String] = None,
        query: Option[String] = None, fragment: Option[String] = None): URI = {
        new URI(if (scheme.isEmpty) uri.getScheme else scheme.get,
            if (userInfo.isEmpty) uri.getUserInfo else userInfo.get,
            if (host.isEmpty) uri.getHost else host.get,
            if (port.isEmpty) uri.getPort else port.get,
            if (path.isEmpty) uri.getPath else path.get,
            if (query.isEmpty) uri.getQuery else query.get,
            if (fragment.isEmpty) uri.getFragment else fragment.get)
    }

    private[indexer] def removeFragment(uri: URI) = {
        if (uri.getFragment != null)
            copyURI(uri, fragment = Some(null))
        else
            uri
    }

    private[indexer] def isBelow(uri: URI, possibleChild: URI) = {
        val r = uri.relativize(possibleChild)
        !r.isAbsolute && uri != possibleChild
    }

    private[indexer] def pathDepth(uri: URI) = {
        uri.getPath.count(_ == '/')
    }
}
