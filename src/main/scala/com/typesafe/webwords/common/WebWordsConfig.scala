package com.typesafe.webwords.common

import akka.actor.{ActorPath, Address}


/**
 * This class represents our app configuration.
 */
case class WebWordsConfig(indexerPath: ActorPath, mongoURL: Option[String], port: Option[Int])

object WebWordsConfig {
    def apply(): WebWordsConfig = {
        val indexerPath = System.getenv("INDEXER_PATH")
        val mongoURL = Option(System.getenv("MONGOHQ_URL"))
        val port = Option(System.getenv("PORT")) map Integer.parseInt
        val config = WebWordsConfig(ActorPath.fromString(indexerPath), mongoURL, port)
        println("Configuration is: " + config)
        config
    }
}
