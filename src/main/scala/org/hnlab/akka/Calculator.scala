package org.hnlab.akka

import akka.actor.Actor

class Calculator extends Actor {
	def receive = {
		case Add(a, b) => 
      println("Calculating %s + %s".format(a, b))
      sender ! AddResult(a, b, a + b)
	}
}

trait MathOp

case class Add(number1: Int, number2: Int) extends MathOp


trait MathResult

case class AddResult(number1: Int, number2: Int, result: Int) extends MathResult