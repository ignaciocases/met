

package org.hnlab.lib

import net.liftweb.util.Helpers._
import net.liftweb.http._
import net.liftweb.common.{Box}

object ObjJServer {
  def serve(req: Req)(): Box[LiftResponse] =
  for {
    url <- LiftRules.getResource(req.path.wholePath.mkString("/", "/", ""))
    urlConn <- tryo(url.openConnection)
    lastModified = ResourceServer.calcLastModified(url)
  } yield {
    req.testFor304(lastModified, "Expires" -> toInternetDate(millis + 30.days)) openOr {
      val stream = url.openStream
      StreamingResponse(stream, () => stream.close, urlConn.getContentLength,
                        (if (lastModified == 0L) Nil else
                         List(("Last-Modified", toInternetDate(lastModified)))) :::
                        List(("Expires", toInternetDate(millis + 30.days)),
                             ("Content-Type","application/text")), Nil,
                        200)
    }
  }

}