/*
 * File
 * Metaphor Project
 *
 * Created by Ignacio Cases
 * Copyright 2012, HnLab. All rights reserved.
 */


package org.hnlab.snippet

import org.hnlab.cardano.core.Cardano
import scala.xml._


class Metaphor extends Cardano {
  override def render(in: NodeSeq): NodeSeq = super.render(in)
}