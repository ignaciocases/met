package org.hnlab.comet

import scala.xml.{NodeSeq,Text}
import net.liftweb.common.{Box,Full,Empty}
import net.liftweb.util.Helpers.{ asDouble }
import net.liftweb.http.{ CometActor, SHtml }
import net.liftweb.util.{ Schedule }
import net.liftweb.http.js.JsCmds.{ Alert, SetHtml, Noop, Script }
import net.liftweb.http.js.{JsCmd, JsCmds}

import akka.actor.{ Actor, ActorSystem }
import com.typesafe.config.ConfigFactory
import akka.dispatch.Future
import akka.pattern.ask
import akka.dispatch.Await
import akka.util.Timeout
import akka.util.duration._
import akka.AkkaException
import org.hnlab.akka._


class CalculatorDisplay extends CometActor {
  
  private var one, two = 0D
  private var operation: Box[String] = Empty

  val system = ActorSystem("LookupApplication", ConfigFactory.load.getConfig("remotelookup"))
  val remoteActor = system.actorFor("akka://MetaphorApplication@127.0.0.1:2552/user/simpleCalculator")
  
  def doubleInput(f: Double => Any) = 
    SHtml.text("0.0", v => f(asDouble(v).openOr(0D)))
  
  def render = 
    "#value_one" #> doubleInput(one = _) &
    "#value_two" #> doubleInput(two = _) &
    "#operation" #> SHtml.select(Seq("+","/","*")
      .map(x => (x -> x)), operation, 
      v => operation = Full(v)) &
    "type=submit" #> SHtml.ajaxSubmit("Submit", () => {
      println("Will send %s + %s".format(one.toInt, two.toInt))
  
      implicit val timeout = Timeout(1 seconds)
      val future = remoteActor ? Add(one.toInt,two.toInt)

      future onSuccess {
         case result: AddResult => {
           println(result)
           this ! result
         }
         case _ => println("Yikes!")
      }      
      Noop
    }) andThen SHtml.makeFormsAjax
  
  override def lowPriority = {
    case value: AddResult => {
      println("Back from Akka: " + value.result)
      partialUpdate(SetHtml("result", Text(value.result.toString)))//Alert("Something"))//SetHtml("result", ))
    }
  }
  
  override def localShutdown = {
    super.localShutdown
    system.shutdown()
  }
}
