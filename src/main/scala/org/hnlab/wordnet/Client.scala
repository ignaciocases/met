// package org.hnlab.wordnet
// 
// import edu.mit.jwi._
// import edu.mit.jwi.item._
// import java.io._
// import java.net.URL
// import scala.collection.JavaConversions._
// 
// object Client extends App {
// 
//  override def main(args: Array[String]) = {
// 
//     val userService = ComponentRegistry.userService
//     
//     val user = userService.authenticate("myUser","myPass")
// 
//     val wordNetStore = WordNetStore
// 
//     val startTime = System.currentTimeMillis
//     
//     
//     val wn = wordNetStore.wn
//     wn.load
//     
//     val finishTime = System.currentTimeMillis
//     println("Elapsed time (ms): " + (finishTime - startTime))
// 
//     try { 
// 
//      val indexWord = wn.getIndexWord(args(0), POS.NOUN)
//       println("IndexWord:\t" + indexWord)
//       //println("IndexWord IDs:\t" + indexWord.getWordIDs)
//       
//      for((id, index) <- indexWord.getWordIDs.zipWithIndex) {
//        //val wordID = indexWord.getWordIDs.get(id)
//        val word = wn.getWord(id)
//        println(word)
//        
//        println("\n****\n"+word.getLemma + "("+(index + 1) +") – " + word.getSynset.getGloss)
//        
//        val synset = word.getSynset
//        println("Synset:\t" + synset)
//        println("Lexical File:\t" + synset.getLexicalFile)
//        println("Type:\t" + synset.getType)
//        println("Words:\t"+ synset.getWords.toList.map(_.getLemma))
//        println("Words ID:\t"+ synset.getWords.toList.map(_.getID))
//        println("Words POS:\t"+ synset.getWords.toList.map(_.getPOS))
//         // println("Words LexID:\t"+ synset.getWords.toList.map(_.getLexicalID))
//        println("Words Related:\t"+ synset.getWords.toList.map(_.getRelatedWords))
//        //println("Lemmas (Scala!):\t" + (new Synset(synset).lemmas))
//        
//        val myList = indexWord.getWordIDs.toList
//        println("Synset: ")
//        for(w <- word.getSynset.getWords) println("\t"+w.getLemma)
//      }        
//       
//     } catch {
//       case e: java.lang.ArrayIndexOutOfBoundsException => println("Please provide a lemma to search for")
//     }
// 
//    
//  }
//    
//  
//  object WordNetStore {
//      val wnhome = System.getenv("WORDNET_RU_HOME")
//      // val path = wnhome + File.separator
//      val path = wnhome
//      val url = new URL("file", null, path)
//   
//     // Normal access
//    val dict = new Dictionary(url)
// 
//     val wn = new RAMDictionary(url, edu.mit.jwi.data.ILoadPolicy.NO_LOAD);
// 
//     try { 
//       wn.open
//     } catch {
//       case e: Exception => println("Error opening WordNet"); false
//     }
// 
//     // class Synset(val name: String) {
//     //   def lemmas: List[String] = synset.getWords.toList.map(_.getLemma)
//     // }
// 
//     
//     // def synsets(term: String): List[Synset] = {
//     // }
//   // 
//   // class WordNet() {
//   //   def indexWordWithString(word: String): edu.mit.jwi.item.IIndexWord = wn.getIndexWord(word, POS.NOUN)
//   //   def wordWithString(word: String) = wn.getWord(indexWordWithString(word))
//   //   def synsetForWord(word: String) = wordWithString(word).getSynset
//   //   def lemmas(word: String) = synsetForWord(word).getWords.toList.map(_.getLemma)
//   // }
//    
//  }
//  
//  
//  // Cake Pattern
//  
//  object ComponentRegistry extends 
//    UserRepositoryComponent with 
//    UserServiceComponent 
//   {
//     // This object acts as a configuration object
//     val userRepository = new UserRepository
//     val userService = new UserService
//   }
//  
//  case class User(username: String, password: String) {
//    override def toString = username
//  }
//  
//  trait UserRepositoryComponent {
//    val userRepository: UserRepository
//     class UserRepository {
//       def authenticate(user: User): User = {
//         println("authenticating user " + user)
//         user
//       }
//       def create(user: User) = println("creating user: " + user)
//       def delete(user: User) = println("deleting user: " + user)
//     }    
//  }
//   
//   trait UserServiceComponent { this: UserRepositoryComponent =>
//     val userService: UserService
//     class UserService {
//       def authenticate(username: String, password: String): User = userRepository.authenticate(new User(username, password))
//       def create(username: String, password: String) = userRepository.create(new User(username, password))
//       def delete(user: User) = userRepository.delete(user)
//     }
//   }
//  
// }