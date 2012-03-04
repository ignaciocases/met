package org.hnlab.foundation

import scala.collection.parallel.{ParMap,ParSeq}
import scala.io.Source.fromInputStream
import java.net.URL

class HNUtil {
  
	def linesFromURL(urlString: String): ParSeq[String] = {
	    val url = new URL(urlString)
	    val raw = fromInputStream(url.openStream).getLines
	    val lines = raw.toList.par
		lines
	}
		
	/**
	 *  The following methods are borrowed from Havoc Pennington - WebWords
	 *  with modifications (Unicode regex)
	 */

	 val notWordRegex = """[^\p{L}\p{Nd}]+""".r
	 
	 def words(lines: ParSeq[String]) = lines flatMap { line =>
		 notWordRegex.split(line) filter { w => w.nonEmpty }
	 }
	 
	 def wordCount(words: ParSeq[String]) = {
	     words.aggregate(Map.empty[String, Int])({ (sofar, word) =>
	         sofar.get(word) match {
	             case Some(old) =>
	                 sofar + (word -> (old + 1))
	             case None =>
	                 sofar + (word -> 1)
	         }
	     }, mergeCounts)
	 }
	
	 def mergeCounts(a: Map[String, Int], b: Map[String, Int]): Map[String, Int] = {
	         val builder = Map.newBuilder[String, Int]
	         val (intersection, notInB) = a partition { kv => b.contains(kv._1) }
	         val notInA = b filter { kv => !a.contains(kv._1) }
	         for ((key, value) <- intersection.iterator) {
	             builder += (key -> (value + b.get(key).get))
	         }
	         builder ++= notInA
	         builder ++= notInB
	         builder.result
	     }
	  
}

object HNUtil {
   class ExtendedParSeq(words: ParSeq[String]) {
	 	
		lazy val index = concordanceIndex(words, w => w)
		
	 	def concordanceIndex(words: ParSeq[String], f: String => String) = for((e,p) <- words.zipWithIndex.groupBy(w => f(w._1))) yield (e, p.unzip._2)

		def concordance(word: String): ParSeq[String] = concordance(word, w => w)

		def concordance(word: String, f: String => String): ParSeq[String] = {
			// FIXME the implementation of the function
			// is not yet correct			
			concordanceIndex(words, f).get(word) match {
				case Some(positions) => {
					for (p <- positions) yield (words.slice(p - 50, p).mkString(" ")).reverse.take(40).reverse + " " + words(p) + " " + words.slice(p + 1, p + 50).mkString(" ").take(40)
				}	
				case None =>
					ParSeq("Not found")
			}		
		}
				
	 }
	 
	 implicit def nlp_extensions_par_seq(seq: ParSeq[String]) = new ExtendedParSeq(seq)
}