// import org.hnlab.foundation.HNUtil
// import gov.llnl.ontology.text.tokenize.OpenNlpMETokenizer
// import org.htmlcleaner.HtmlCleaner
// import org.apache.commons.lang3.StringEscapeUtils
// import java.net.URL
// import scala.io.Source
// 
// import scala.collection.parallel.{ParMap,ParSeq}
// import scala.io.Source.fromInputStream
// import java.net.URL
//    
// class ExtendedParSeq(words: ParSeq[String]) {
// 	 	
// 	lazy val index = concordanceIndex(words, w => w)
// 		
//     def concordanceIndex(words: ParSeq[String], f: String => String) = for((e,p) <- words.zipWithIndex.groupBy(w => f(w._1))) yield (e, p.unzip._2)
// 
// 	def concordance(word: String): Unit = concordance(word, w => w)
// 
// 	def concordance(word: String, f: String => String): Unit = {		
// 		concordanceIndex(words, f).get(word) match {
// 			case Some(positions) => {
// 				for (p <- positions) println( (words.slice(p - 50, p).mkString(" ")).reverse.take(40).reverse + " " + words(p) + " " + words.slice(p + 1, p + 50).mkString(" ").take(40) )
// 			}	
// 			case None =>
// 				println("Not found")
// 		}		
// 	}
// 				
// }
// 
// 	 
// implicit def nlp_extensions_par_seq(seq: ParSeq[String]) = new ExtendedParSeq(seq)
//    
//     
// val util = new HNUtil
// // Tokenize with OpenNLP tokenizer
// val tokenizer = new OpenNlpMETokenizer
//     
// val source = Source.fromFile("/Development/metaphor/data/corpora/gutenberg/cervantes-don_quijote.txt").mkString
// val quijote = (tokenizer.tokenize(source)).toList.par
// quijote.concordance("mancha", (s => s.toLowerCase))
// quijote.concordance("mancha", (s => s.endsWith("s")))
// 
// val rg = """perros?""".r
// qmap.foreach(e => rg.findFirstIn(e._1) match { 
//     case Some(x) => (x, e._2) 
//     case None => 
//     })
