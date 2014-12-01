// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node <T: Equatable> : NilLiteralConvertible {
  var value : T
  var next : Node?

  init (value: T) {
    self.value = value
  }

  required init(nilLiteral: ()) {

  }

}

class LinkedList <T:Equatable> {
  var first : Node<T>?

  func push(value: T) {
    if self.first == nil {
      self.first = Node(value: value)
      println("created")
    } else if self.first?.next == nil {
      self.first?.next = Node(value: value)
      println("added")
    } else {
      var node = self.first!
      while node.next? != nil {
        node.next = node.next?.next
        println("iterated")
      }
      node.next = Node(value: value)
      println("appended \(value)")
    }
  }

  func pop ()-> T {
    var value: T?
    if self.first? == nil {
      println("empty list")
      return nil
    } else {
      println("here")
      var current = self.first?
      var nextN = self.first?.next
      println("current: \(current?.value)")

      while nextN != nil {
        println("iterated more")
        current = nextN?
        nextN = nextN?.next?.next
      }
      value = current?.value
      current = nextN

    }
    return value!

  }





}

var ll = LinkedList<String>()
var lk = LinkedList<String>()

ll.push("This")
ll.push("Is")
ll.push("A")
ll.push("List")
var this = ll.pop()
var mine = lk.pop()

