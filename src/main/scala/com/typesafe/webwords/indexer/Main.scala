// package com.typesafe.webwords.indexer
// 
// import akka.actor._
// import akka.pattern.ask
// import com.typesafe.webwords.common._
// import java.util.concurrent.CountDownLatch
// 
// /**
//  * This is the main() method for the indexer (worker) process.
//  * The indexer gets requests to "index" a URL from a work queue,
//  * storing results in a persistent cache (kept in MongoDB).
//  */
// object Main extends App {
//     private val system = ActorSystem("WebWordsIndexer")
// 
//     val config = WebWordsConfig()
// 
//     val worker = system.actorOf(Props(new WorkerActor(config)), "index-worker")
// 
//     // kind of a hack maybe.
//     val waitForever = new CountDownLatch(1)
//     waitForever.await
// }
