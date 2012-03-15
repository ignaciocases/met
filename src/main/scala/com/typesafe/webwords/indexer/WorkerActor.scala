package com.typesafe.webwords.indexer

import akka.actor._
import akka.pattern.{ask, pipe}
import com.typesafe.webwords.common._
import java.net.URL
import akka.util.Timeout

/**
 * This actor listens to the work queue, spiders and caches results.
 * It's the "root" actor of the indexer process.
 */
class WorkerActor(mongoURL: Option[String])
    extends Actor with ActorLogging {

    private val spider = context.actorOf(Props[SpiderActor], "spider")
    private val cache = context.actorOf(Props(new IndexStorageActor(mongoURL)), "index-storage")

    implicit val timeout = Timeout(context.system.settings.config.getMilliseconds("akka.timeout.default"))

    def receive = {
        case request: WorkQueueRequest => request match {
            case SpiderAndCache(url) =>
                log.debug("SpiderAndCache({})", url)
                // Here we task the spider to Spider the url, and if the result is Spidered, we ask
                // the cache to CacheIndex the index, and if that works we return SpideredAndCached.
                // If anything goes wrong, we simply return SpideredAndCached anyway, since the one
                // requesting the SpiderAndCache will try to read the result from the cache and check
                // for failure there.
                (spider ? Spider(new URL(url)) map {
                    case Spidered(_, index) => index
                } flatMap {
                    index => cache ? CacheIndex(url, index) map { _ => SpideredAndCached(url) }
                } recover {
                    case _ => SpideredAndCached(url)
                }).mapTo[WorkQueueReply] pipeTo sender
        }
    }
}
