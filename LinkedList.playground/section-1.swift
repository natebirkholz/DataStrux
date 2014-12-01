// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node <T: Equatable> {
  var value : T
  var next : Node?

  init (value: T) {
    self.value = value
  }

}

class LinkedList <T:Equatable> {
  var first : Node<T>?

  func push(value: T) {
    if self.first == nil {
      self.first = Node(value: value)
      println("created")
    } else {
      var newNode  = Node(value: value)
      newNode.next = first
      first = newNode
      println("added")
    }
  }

  func pop ()-> T? {
    var val: T?

    if self.first? == nil {
      println("empty list")
      val = nil
    } else {
      val = self.first?.value
      self.first = self.first?.next
    }
    return val
  }

  func enqueue(value: T) {
    if self.first == nil {
      self.first = Node(value: value)
      println("created")
    } else {
      var newNode  = Node(value: value)
      newNode.next = first
      first = newNode
      println("added")
    }
  }

  func dequeue() -> T? {
    var val : T?
    if self.first? == nil {
      println("empty queue")
      return nil
    } else if self.first?.next? == nil {
      val = self.first?.value
      self.first = self.first?.next
    } else {
      var previous : Node<T>?
      var current = self.first

      while current?.next != nil {
        previous = current
        current = current?.next
      }
      val = current?.value
      previous?.next = current?.next
    }
    return val
  }

} // End

var ll = LinkedList<String>()
var lk = LinkedList<String>()

ll.enqueue("This")
ll.enqueue("Is")
ll.enqueue("A")
ll.enqueue("List")

let aA = ll.dequeue()
let bB = ll.dequeue()
let cC = ll.dequeue()
let dD = ll.dequeue()
let eE = ll.dequeue()

lk.push("This")
lk.push("Is")
lk.push("A")
lk.push("List")


let aa = lk.pop()
let bb = lk.pop()
let cc = lk.pop()
let dd = lk.pop()
let ee = lk.pop()




