package org.hnlab

import org.scalatest.{BeforeAndAfter, Spec}

import net.liftweb._
import mongodb._

import com.mongodb.{Mongo, ServerAddress}

/**
  * Creates a Mongo instance named after the class. 
  * Therefore, each Spec class shares the same database.
  * Database is dropped after.
  */
trait MongoTestKit extends BeforeAndAfter {
  this: Spec =>

  def dbName = "test_"+this.getClass.getName
    .replace(".", "_")
    .toLowerCase

  def defaultServer = new ServerAddress("127.0.0.1", 27017)

  // If you need more than one db, override this
  def dbs: List[(MongoIdentifier, ServerAddress, String)] = List((DefaultMongoIdentifier, defaultServer, dbName))

  def debug = false

  before {
    // define the dbs
    dbs foreach { case (id, srvr, name) =>
      MongoDB.defineDb(id, new Mongo(srvr), name)
    }
  }

  after {
    if (!debug) {
      // drop the databases
      dbs foreach { case (id, _, _) =>
        MongoDB.use(id) { db => db.dropDatabase }
      }
    }

    // clear the mongo instances
    MongoDB.close
  }
}

