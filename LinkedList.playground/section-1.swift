// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node {
  var value : String
  var next : Node?

  init (value: String) {
    self.value = value
  }

}

class LinkedList : Printable <T:Equatable> {
  var first : Node?

  func pushNode(value: String) {
    if self.first == nil {
      self.first = Node(value: value)
    } else if self.first?.next == nil {
      self.first!.next = Node(value: value)
    } else {
      var node = self.first!
      while node.next != nil {
        node.next = node
      }
      node.next = Node(value: value)
    }
  }
}

var ll = LinkedList<String>()

ll.pushNode("This")
