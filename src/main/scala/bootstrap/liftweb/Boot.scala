package bootstrap.liftweb

import net.liftweb._
import common._
import http._
import http.provider._
import util._
import util.Helpers._
import sitemap._
import Loc._
import Helpers._

import net.liftweb.http.js.jquery.JQuery14Artifacts

// Cardano
import org.hnlab.lib.ObjJServer
import org.hnlab.model._

import org.hnlab.config._
import org.hnlab.lib.Gravatar
import org.hnlab.model.User

// MongoDB
import net.liftmodules.mongoauth.MongoAuth

// Akka
import akka.actor.{ Actor, ActorSystem, Props => AkkaProps }
import akka.remote.RemoteActorRefProvider
import org.hnlab.akka._
import com.typesafe.config.ConfigFactory
import com.typesafe.webwords.common.WebWordsConfig
import com.typesafe.webwords.indexer.WorkerActor

/**
 * A class that's instantiated early and run.  It allows the application
 * to modify lift's environment
 */
class Boot extends Loggable {
  def boot {
    logger.info("Run Mode: "+Props.mode.toString)

    // init mongodb
    MongoConfig.init()

    // init auth-mongo
    MongoAuth.authUserMeta.default.set(User)
    MongoAuth.loginTokenAfterUrl.default.set(Site.password.url)
    // MongoAuth.siteName.default.set("Metaphor Project")
    // MongoAuth.systemEmail.default.set("") // TODO: Set me
    // MongoAuth.systemUsername.default.set("Metaphor Project Staff")

    // For S.loggedIn_? and TestCond.loggedIn/Out builtin snippet
    LiftRules.loggedInTest = Full(() => User.isLoggedIn)

    // checks for ExtSession cookie
    LiftRules.earlyInStateful.append(User.testForExtSession)

    // Gravatar
    Gravatar.defaultImage.default.set("wavatar")

    // config an email sender
    // SmtpMailer.init

    // where to search snippet
    LiftRules.addToPackages("org.hnlab")

    // set the default htmlProperties
    LiftRules.htmlProperties.default.set((r: Req) => new Html5Properties(r.userAgent))

    // Build SiteMap
    LiftRules.setSiteMap(Site.siteMap)
	
    // Error handler
    ErrorHandler.init

    // 404 handler
    LiftRules.uriNotFound.prepend(NamedPF("404handler") {
      case (req, failure) =>
        NotFoundAsTemplate(ParsePath(List("404"), "html", false, false))
    })

    /**
     * Cardano
     * To avoid ajax retries when the operation is expensive
     * the retry is limited to one, and time to consider the
     * server has not responded to 30s
     */
    LiftRules.ajaxRetryCount = Full(1)
    LiftRules.ajaxPostTimeout = 30000

    /**
     * Database for Cappuccino development
     */
    // object Database extends StandardDBVendor( 
    // 	Props.get("db.class").openOr("org.h2.Driver"), 
    // 	Props.get("db.url").openOr("jdbc:h2:database/metaphor_dev;AUTO_SERVER=TRUE"), 
    // 	Props.get("db.user"),
    // 	Props.get("db.pass"))

    // Show the spinny image when an Ajax call starts
    LiftRules.ajaxStart =
      Full(() => LiftRules.jsArtifacts.show("/images/spinner.gif").cmd)

    // Make the spinny image go away when it ends
    LiftRules.ajaxEnd =
      Full(() => LiftRules.jsArtifacts.hide("/images/spinner.gif").cmd)

    // Force the request to be UTF-8
    LiftRules.early.append(_.setCharacterEncoding("UTF-8"))
    
	// We serve Cappuccino files with wicked friendly
    // mime types
    LiftRules.liftRequest.append {
      case Req( _, "j", GetRequest) => true
      case Req( _, "sj", GetRequest) => true
      case Req( _, "plist", GetRequest) => true
    }

    LiftRules.statelessDispatchTable.prepend {
      case r @ Req( _, "j", GetRequest) => ObjJServer.serve(r)
      case r @ Req( _, "sj", GetRequest) => ObjJServer.serve(r)
      case r @ Req( _, "plist", GetRequest) => ObjJServer.serve(r)
    }
	
	  // Initialize Akka actors
    try {
      val system = ActorSystem("MetaphorApplication", ConfigFactory.load.getConfig("metaphor"))
  	  val actor = system.actorOf(AkkaProps[org.hnlab.akka.HelloWorldActor], "simpleMetaphor")
  	  val calculator = system.actorOf(AkkaProps[org.hnlab.akka.Calculator], "simpleCalculator")
      val spider = system.actorOf(AkkaProps[com.typesafe.webwords.indexer.SpiderActor], "spider")
      val fetcher = system.actorOf(AkkaProps[org.hnlab.metaphor.akka.FetcherActor], "fetcher")
      val recognizer = system.actorOf(AkkaProps[org.hnlab.metaphor.akka.RecognizerActor], "recognizer")
      
      val mongoURL = Props.get("mongo.default.url").openOr("mongodb://localhost:27017/metaphorProject_indexer")

      val worker = system.actorOf(AkkaProps(new WorkerActor(Some(mongoURL))), "index-worker")
      
    
    } catch {
        case e:java.net.BindException => logger.debug("Bind exception")
    }
	
  }
}
