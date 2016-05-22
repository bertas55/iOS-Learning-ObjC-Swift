//
//  List.swift
//  ListSwift
//
//  Created by Hubert on 11.03.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

import UIKit

class List {
  // this should be private
  var head : Element?
  var tail : Element?


  init() {

    self.head = nil
    self.tail = nil

  }

  func empty() -> Bool {

    return self.head == nil

  }

  func size() -> Int {

    var size = 0
    var tmp = self.head

    while(tmp != nil) {

      size++
      tmp = tmp?.next

    }

    return size

  }

  func front() -> Element? {

    return self.head

  }

  func back() -> Element? {

    return self.tail

  }


  func pushFront(elem : Element) {

    let tmp = elem

    if(self.empty()) {

      self.tail = tmp
      self.head = tmp

    } else {

      tmp.next = self.head
      self.head!.prev = tmp
      self.head = tmp
    }

  }

  func pushBack(elem : Element) {

    let tmp = elem

    if(self.empty()) {

      self.tail = tmp
      self.head = tmp

    } else {

      self.tail?.next = tmp
      tmp.prev = self.tail
      self.tail = tmp
    }

  }

  func popFront() -> Element? {

    let tmp = self.head

    self.head = tmp?.next
    tmp?.next?.prev = nil

    return tmp
    
  }

  func popBack() -> Element? {

    let tmp = self.tail

    tmp?.prev?.next = nil
    self.tail = tmp?.prev

    return tmp

  }

  func getAtIndex(index : Int) -> Element? {

    var retVal : Element?

    if(index >= self.size() || index < 0) {

      retVal = nil

    } else {

      var tmp : Element? = self.front()
      var x = 0

      while(tmp != nil && x < index) {

        tmp = tmp?.next

        x++

      }

      retVal = tmp

    }

    return retVal

  }

}
