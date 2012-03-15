package org.hnlab.comet

import scala.xml.{NodeSeq,Text}
import net.liftweb.common.{Box,Full,Empty}
import net.liftweb.util.Helpers.{ asDouble }
import net.liftweb.http.{ CometActor, SHtml }
import net.liftweb.util.{ Schedule }
import net.liftweb.http.js.JsCmds.{ Alert, SetHtml, Noop, Script }
import net.liftweb.http.js.{JsCmd, JsCmds}

import akka.actor._
import akka.dispatch._
import com.typesafe.config.ConfigFactory
import akka.pattern.ask
import akka.util.Timeout
import akka.util.duration._
import akka.AkkaException
import org.hnlab.metaphor.akka._
import com.typesafe.webwords.common._
import com.typesafe.webwords.indexer._

import java.net.URL
import java.net.URI
import java.net.MalformedURLException
import java.net.URISyntaxException

class RecognizerDisplay extends CometActor {
  
  private var targetURL: URL = new URL("http://")

  val system = ActorSystem("LookupApplication", ConfigFactory.load.getConfig("remotelookup"))
  val spider = system.actorFor("akka://MetaphorApplication@127.0.0.1:2552/user/spider")
      
  def stringInput(s: String) = {
    targetURL = parseURL(s).getOrElse(new URL("http://"))
    Noop
  }
  
  def render = 
    "#url_input" #> SHtml.text("http://en.wikipedia.org/wiki/Isaac_Casaubon", stringInput _) &
    "type=submit" #> SHtml.ajaxSubmit("Submit", () => {
  
      implicit val timeout = Timeout(25 seconds)
      val future = spider ? Spider(targetURL)

      future onSuccess {
         case fetched: Spidered => {
           this ! fetched
         }
         case _ => println("Yikes!")
      }      
      Noop
    }) andThen SHtml.makeFormsAjax
  
  override def lowPriority = {
    case fetched: Spidered => {
      println("Back from Akka: " + fetched.index.wordCounts)
      partialUpdate(SetHtml("result", Text(fetched.index.wordCounts.toString)))//Alert("Something"))//SetHtml("result", ))
    }
  }
  
  override def localShutdown = {
    super.localShutdown
    system.shutdown()
  }
  
  /* 
  * From WebWords
  */
  private def parseURL(s: String): Option[URL] = {
     val maybe = try {
         new URI(s) // we want it to be a valid URI also
         Some(new URL(s))
     } catch {
         case e: MalformedURLException => None
         case e: URISyntaxException => None
     }
     maybe.orElse({
         if (s.startsWith("http"))
             None
         else
             parseURL("http://" + s)
     })
  }
}