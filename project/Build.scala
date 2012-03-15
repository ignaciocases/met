import sbt._
import sbt.Keys._
import com.github.siasia._
import PluginKeys._
import WebPlugin._
import WebappPlugin._
import less.Plugin._
import sbtclosure.SbtClosurePlugin._

object ProjectBuild extends Build {

  lazy val root = Project(
    id = "root",
    base = file("."),
    settings = Project.defaultSettings ++ lessSettings ++ closureSettings ++ webSettings ++ Seq(
      name := "Metaphor Project",
      organization := "HnLab",
      version := "0.1-SNAPSHOT",
      scalaVersion := "2.9.1",
      // JRebel
      scanDirectories in Compile := Nil,
      // compile options
      scalacOptions ++= Seq("-encoding", "UTF-8", "-deprecation", "-unchecked"),
      javacOptions  ++= Seq("-Xlint:unchecked", "-Xlint:deprecation"),
      // show full stack traces
      testOptions in Test += Tests.Argument("-oF"),
      // Less
      (LessKeys.filter in (Compile, LessKeys.less)) := "*styles.less",
      (LessKeys.mini in (Compile, LessKeys.less)) := true,
      // add managed resources, where less and closure publish to, to the webapp
      (webappResources in Compile) <+= (resourceManaged in Compile),
      // resolvers
      resolvers += "Typesafe Releases" at "http://repo.typesafe.com/typesafe/releases",
      resolvers += "Typesafe repository" at "http://typesafe.artifactoryonline.com/typesafe/ivy-releases/",
      resolvers += "Java.net Maven2 Repo" at "http://download.java.net/maven/2/",
      resolvers += "Sonatype OSS Snapshot Repository" at "https://oss.sonatype.org/content/repositories/snapshots/",
      resolvers += "Liftmodules repo" at "https://repository-liftmodules.forge.cloudbees.com/release",
      unmanagedJars in Compile <++= baseDirectory map { base =>
        val libs = base / "lib"
        val dirs = libs // to add more: (libs / "batik") +++ (libs / "libtw") +++ (libs / "kiama")
        (dirs ** "*.jar").classpath
      },
      libraryDependencies ++= {
        val akkaVersion = "2.0"
		    Seq(
          "com.typesafe.akka" % "akka-actor" % akkaVersion,
          "com.typesafe.akka" % "akka-remote" % akkaVersion
			  )
      },
      libraryDependencies ++= {
        val liftVersion = "2.4"
        Seq(
          "net.liftweb" %% "lift-webkit" % liftVersion % "compile->default" withSources(),
          "net.liftweb" %% "lift-mapper" % liftVersion % "compile->default" withSources(),
          "net.liftweb" %% "lift-wizard" % liftVersion % "compile->default" withSources(),
          "net.liftweb" %% "lift-mongodb-record" % liftVersion,
		      "net.liftweb" %% "lift-amqp" % liftVersion, 										// RabbitMQ client
          "net.liftmodules" %% "mongoauth" % (liftVersion+"-0.3")
        )},
        libraryDependencies ++= Seq(
          "org.hnlab" %% "cardano-core" % "0.1.3",
          // There is a collision between this and slf4j
          // "ch.qos.logback" % "logback-classic" % "1.0.0",
          "org.scalatest" %% "scalatest" % "1.6.1" % "test", 
          "junit" % "junit" % "4.5" % "test->default",
          //"org.eclipse.jetty" % "jetty-webapp" % "7.5.4.v20111024" % "container",
          "org.mortbay.jetty" % "jetty" % "6.1.21" % "container",
          "javax.servlet" % "servlet-api" % "2.5" % "provided->default",
          "com.h2database" % "h2" % "1.2.138",
          "postgresql" % "postgresql" % "9.0-801.jdbc4" % "compile->default",
          // Webwords
          "com.ning" % "async-http-client" % "1.6.5",
          "com.mongodb.casbah" %% "casbah-core" % "2.1.5-1",
          "org.jsoup" % "jsoup" % "1.6.1"
        )
      )
    )
  }
