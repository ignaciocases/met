package com.typesafe.webwords.common

sealed trait WorkQueueMessage

sealed trait WorkQueueRequest extends WorkQueueMessage
case class SpiderAndCache(url: String) extends WorkQueueRequest

sealed trait WorkQueueReply extends WorkQueueMessage
case class SpideredAndCached(url: String) extends WorkQueueReply
