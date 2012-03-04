package org.hnlab.akka

import akka.actor._

class HelloWorldActor extends Actor {
	
	def receive = {
		case "Hello" => println("Message received!")
	}

}