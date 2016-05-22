//
//  Element.swift
//  ListSwift
//
//  Created by Hubert on 11.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

import UIKit

class Element {

  var elem : String?
  var next : Element?
  var prev : Element?

  init() {

    self.elem = nil
    self.next = nil
    self.prev = nil

  }

  init(initObj : String) {

    self.elem = initObj
    self.next = nil
    self.prev = nil

  }



}
