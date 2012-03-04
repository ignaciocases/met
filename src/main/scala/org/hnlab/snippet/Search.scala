package org.hnlab
package snippet

import org.hnlab.lib._

import java.util.Date
import scala.xml._

import net.liftweb._
import common._
import util._
import Helpers._

import http.{DispatchSnippet, S, SessionVar, SHtml, StatefulSnippet, WiringUI}
import http.js._
import net.liftweb.http.js.JE._
import net.liftweb.http.js.JsCmds._

import org.hnlab.foundation.HNUtil
import HNUtil._
import scala.collection.parallel.ParSeq
import gov.llnl.ontology.text.tokenize.OpenNlpMETokenizer
import org.htmlcleaner.HtmlCleaner
import org.apache.commons.lang3.StringEscapeUtils
import java.net.URL
import scala.io.Source

object SearchWiring{
    val query = ValueCell("All")
}

class Search {
  
    val util = new HNUtil
  
    def concordance(q: String): List[String] = DonQuijote.is.concordance(q).toList
    
    def con(q: String): List[(String, Int)] = concordance(q).zipWithIndex
    
    def count(q: String) = util.wordCount(DonQuijote.is).get(q) match {
      case Some(number) => number
      case _ => 0
    }

    val query = SHtml.ajaxText("", s => { SearchWiring.query.set(s); Noop })

    def display = {
      WiringUI.apply(SearchWiring.query){ query: String => {
        "li" #> con(query).map(t =>  ("li [class]" #> ("L" + t._2).toString) & ("li *" #> <span>{t._1}</span>)) &
        "#count *" #> <i>{if(count(query) > 0) { "Found #" + count(query).toString + " results"}}</i>   
        }}
    }

    def render =  
        "@one" #> ""
}

class DonQuijoteBuilder {
  val util = new HNUtil
  
  // Tokenize with OpenNLP tokenizer
  val tokenizer = new OpenNlpMETokenizer
  
  //val source = Source.fromFile("/Development/metaphor/data/corpora/gutenberg/cervantes-don_quijote.txt").mkString
  val source = """Por cuanto por parte de vos, Miguel de Cervantes, nos fue fecha relación
  que habíades compuesto un libro intitulado El ingenioso hidalgo de la
  Mancha, el cual os había costado mucho trabajo y era muy útil y provechoso,
  nos pedistes y suplicastes os mandásemos dar licencia y facultad para le
  poder imprimir, y previlegio por el tiempo que fuésemos servidos, o como la
  nuestra merced fuese; lo cual visto por los del nuestro Consejo, por cuanto
  en el dicho libro se hicieron las diligencias que la premática últimamente
  por nos fecha sobre la impresión de los libros dispone, fue acordado que
  debíamos mandar dar esta nuestra cédula para vos, en la dicha razón; y nos
  tuvímoslo por bien. Por la cual, por os hacer bien y merced, os damos
  licencia y facultad para que vos, o la persona que vuestro poder hubiere, y
  no otra alguna, podáis imprimir el dicho libro, intitulado El ingenioso
  hidalgo de la Mancha, que desuso se hace mención, en todos estos nuestros
  reinos de Castilla, por tiempo y espacio de diez años, que corran y se
  cuenten desde el dicho día de la data desta nuestra cédula; so pena que la
  persona o personas que, sin tener vuestro poder, lo imprimiere o vendiere,
  o hiciere imprimir o vender, por el mesmo caso pierda la impresión que
  hiciere, con los moldes y aparejos della; y más, incurra en pena de
  cincuenta mil maravedís cada vez que lo contrario hiciere. La cual dicha
  pena sea la tercia parte para la persona que lo acusare, y la otra tercia
  parte para nuestra Cámara, y la otra tercia parte para el juez que lo
  sentenciare. Con tanto que todas las veces que hubiéredes de hacer imprimir
  el dicho libro, durante el tiempo de los dichos diez años, le traigáis al
  nuestro Consejo, juntamente con el original que en él fue visto, que va
  rubricado cada plana y firmado al fin dél de Juan Gallo de Andrada, nuestro
  Escribano de Cámara, de los que en él residen, para saber si la dicha
  impresión está conforme el original; o traigáis fe en pública forma de cómo
  por corretor nombrado por nuestro mandado, se vio y corrigió la dicha
  """
  val quijote = (tokenizer.tokenize(source)).toList.par
//  val quijoteFD = util.wordCount(quijote)
//  val molino = quijote.concordance("molino").toList.zipWithIndex  
}

object DonQuijote extends SessionVar[ParSeq[String]](new DonQuijoteBuilder().quijote)
