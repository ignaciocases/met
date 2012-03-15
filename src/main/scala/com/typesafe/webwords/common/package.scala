package com.typesafe.webwords

import java.net.URI
import java.net.URISyntaxException
import akka.actor._
import akka.util.Duration
import akka.dispatch.{Promise, ExecutionContext}
import java.util.concurrent.TimeoutException

/**
 * This file contains random utility functions.
 * Some of them may be interesting.
 */
package object common {

    private def stripSlash(s: String) =
        if (s == "")
            null
        else if (s.startsWith("/"))
            s.substring(1)
        else
            s

    case class URIParts(scheme: String, user: Option[String], password: Option[String],
        host: Option[String], port: Option[Int], path: Option[String])

    def expandURI(s: String, defaults: URIParts): Option[URIParts] = {
        try {
            val uri = new URI(s)

            val host = Option(uri.getHost) orElse (defaults.host)
            val port = (if (uri.getPort == -1) None else Some(uri.getPort)) orElse (defaults.port)

            // URI has the "/" in front of the path but URIParts strips it off.
            val path = Option(stripSlash(uri.getPath)) orElse (defaults.path)
            val userInfo = Option(uri.getUserInfo)
            val (user, password) = userInfo map { ui =>
                if (ui.contains(":")) {
                    val a = ui.split(":", 2)
                    (Some(a(0)) -> Some(a(1)))
                } else {
                    (Some(ui) -> defaults.password)
                }
            } getOrElse (defaults.user -> defaults.password)

            Some(URIParts(scheme = uri.getScheme, user = user, password = password,
                host = host, port = port, path = path))
        } catch {
            case e: URISyntaxException =>
                None
        }
    }

    /** Create a [[akka.dispatch.Promise]] that will completed after [[akka.util.Duration]].
     *
     * Schedule a handler that completes the [[akka.dispatch.Promise]] after [[akka.util.Duration]],
     * and also try to cancel the scheduled handler if the [[akka.dispatch.Promise]] completes.
     *
     * @return [[akka.dispatch.Promise]]
     */
    def withTimeout[T](at: Duration, scheduler: akka.actor.Scheduler)(implicit executor: ExecutionContext): Promise[T] = {
        val p = Promise[T]()
        val cancellable = scheduler.scheduleOnce(at) { p.tryComplete(Left(new TimeoutException("Scheduled timeout"))) }
        p.onComplete(_ => cancellable.cancel)
        p
    }
}
