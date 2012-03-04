package org.hnlab.wordnet

import gov.llnl.ontology.wordnet.OntologyReader
import gov.llnl.ontology.wordnet.WordNetCorpusReader
import gov.llnl.ontology.wordnet.Synset
// Part of Speech
import gov.llnl.ontology.wordnet.Synset._
// Relations
import gov.llnl.ontology.wordnet.Synset.Relation
import gov.llnl.ontology.wordnet._
import scala.collection.JavaConversions._

object WordNetExercises extends App {
  
  override def main(args: Array[String]) = {

    // WordNet location is set in an environment variable
    val wnPath = System.getenv("WORDNET_DICT")

    // Load the corpus
    val wn = WordNetCorpusReader.initialize(wnPath)
    
    // val motorcar = wn.getSynsets("motorcar")
    // println(motorcar)
    
    val motorcar = wn.getSynset("motorcar", PartsOfSpeech.NOUN, 1)
    motorcar.getLemmas.toList
    val lemmas = motorcar.getLemmas.toList
    println(lemmas.map(_.getLemmaName))
    motorcar.getLemmas.map(_.getLemmaName).toList
    motorcar.getDefinition
    motorcar.getExamples
    
    val carLemma = motorcar.getLemmas.toList(0)
    carLemma.getLemmaName
    carLemma.getSynset
    
    motorcar.getRelations(Relation.HYPERNYM)
    motorcar.getRelations(Relation.HYPONYM)

    // Hyponyms
    val motorcarTypes = motorcar.getRelations(Relation.HYPONYM).toSet

    // Returns a list with duplicates
    val motorcarTypeNames = for(synset <- motorcarTypes; lemma <- synset.getLemmas) yield lemma.getLemmaName
    for(n <- motorcarTypeNames) println(n)
    
    // Remove the duplicates with a set
    val motorcarTypeNamesSet = (for(synset <- motorcarTypes; lemma <- synset.getLemmas) yield lemma.getLemmaName).toSet
    for(n <- motorcarTypeNamesSet) println(n)
    
    
    // Hypernyms
    
  }
  
  class ExtendedWordNet(wn: WordNetCorpusReader) {
    
    def synsets(s: String) = wn.getSynsets(s).toList
    def synset(s: String): Synset = synsetFinder(s) match {
      case Some(synset) => synset
      case _ => new BaseSynset("")
    }
    
    
    def synsetFinder(s: String): Option[Synset] = {
      val errorMessage = "WordNet synset method accepts strings with forma lemma.POS.number"
      try { 
         Some(wn.getSynset(s))
      } catch {
        case e: java.lang.NumberFormatException => println(errorMessage); None
        case e: Exception => println(errorMessage); None
        case _ => None
      }
    }
  }
  
  implicit def wordnet_with_extensions(wn: WordNetCorpusReader) = new ExtendedWordNet(wn)
  
  class ExtendedSynset(s: Synset) {
    
    // Lemmata
    def lemmata = s.getLemmas.toList
    def lemmataNames = s.getLemmas.map(_.getLemmaName).toList
    
    // Relations
    def antonyms = s.getRelations(Relation.ANTONYM).toList
    def hypernyms = s.getRelations(Relation.HYPERNYM).toList
    def hypernymsNames = (for(synset <- hypernyms; lemma <- synset.getLemmas) yield lemma.getLemmaName).distinct.sorted
    def hyponyms = s.getRelations(Relation.HYPONYM).toList
    def hyponymsNames = (for(synset <- hyponyms; lemma <- synset.getLemmas) yield lemma.getLemmaName).distinct.sorted
    
    def partMeronyms = s.getRelations(Relation.PART_MERONYM).toList
    def substanceMeronyms = s.getRelations(Relation.SUBSTANCE_MERONYM).toList
    def memberMeronyms = s.getRelations(Relation.MEMBER_MERONYM).toList
    
    def partHolonyms = s.getRelations(Relation.PART_HOLONYM).toList
    def substanceHolonyms = s.getRelations(Relation.SUBSTANCE_HOLONYM).toList
    def memberHolonym = s.getRelations(Relation.MEMBER_HOLONYM).toList
    
    def entailments = s.getRelations(Relation.ENTAILMENT).toList

    // Path similarity

  }
  
  implicit def synset_with_extensions(s: Synset) = new ExtendedSynset(s)

  
  class ExtendedLemma(l: Lemma) {
    override def toString = l.getLemmaName
  }

  implicit def lemma_with_extensions(l: Lemma) = new ExtendedLemma(l)
  implicit def base_lemma_with_extensions(l: BaseLemma) = new ExtendedLemma(l)

}

/*

Synset API

addDerivationallyRelatedForm   addExample                     addLemma                       addMorphyMapping               addRelation                    addSenseKey                    
allRelations                   asInstanceOf                   attributeLabels                getAttribute                   getChildren                    getDefinition                  
getDerivationallyRelatedForm   getExamples                    getFrameIds                    getGloss                       getId                          getKnownRelationTypes          
getLemmaIds                    getLemmas                      getMaxDepth                    getMinDepth                    getName                        getNumRelations                
getParentPaths                 getParents                     getPartOfSpeech                getRelations                   getSenseKey                    getSenseKeys                   
getSenseNumber                 isInstanceOf                   merge                          removeRelation                 setAttribute                   setDefinition                  
setFrameInfo                   setId                          setSenseNumber                 toString                       


Lemma API

asInstanceOf           getKey                 getLemmaName           getLexNameIndex        getLexicalId           getLexicographerName   getSynset              isInstanceOf           
toString

Relation API
ALSO_SEE                       ANTONYM                        ATTRIBUTE                      CAUSE                          DERIVATIONALLY_RELATED_FORMS   ENTAILMENT                     
HYPERNYM                       HYPONYM                        INSTANCE_HYPERNYM              INSTANCE_HYPONYM               MEMBER_HOLONYM                 MEMBER_MERONYM                 
PART_HOLONYM                   PART_MERONYM                   SIMILAR_TO                     SUBSTANCE_HOLONYM              SUBSTANCE_MERONYM              VERB_GROUPS                    

*/