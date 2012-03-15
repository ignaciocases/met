package org.hnlab.metaphor.akka

import akka.actor._

class FetcherActor extends Actor {
	
	def receive = {
		case "Hello" => println("Message received!")
	}

}
