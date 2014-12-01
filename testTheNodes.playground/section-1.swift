// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node {
  var value: Int
  var lesser : Node?
  var greater : Node?

  init (value: Int){
    self.value = value
  }
}

var head = Node(value: 110)
head.lesser = Node(value: 107) as Node!
println(head.lesser?.value)
head.lesser?.lesser = Node(value: 106) as Node!
println(head.lesser?.lesser?.value)
head.lesser?.greater = Node(value: 108) as Node!
println(head.lesser?.greater?.value)
head.lesser?.greater?.greater = Node(value: 109)
println(head.lesser?.greater?.greater?.value)
head.greater = Node(value:114) as Node!
println(head.greater?.value)
head.greater?.lesser = Node(value: 111) as Node!
println(head.greater?.lesser?.value)
head.greater?.lesser?.greater = Node(value: 112) as Node!
println(head.greater?.lesser?.greater?.value)
head.greater?.lesser?.greater?.greater = Node(value: 113) as Node!
println(head.greater?.lesser?.greater?.greater?.value)
head.greater?.greater = Node(value: 118) as Node!
println(head.greater?.greater?.value)

println(head.value)
println(head.lesser?.value)
println(head.lesser?.lesser?.value)
println(head.lesser?.greater?.value)
println(head.lesser?.greater?.greater?.value)
println(head.greater?.value)
println(head.greater?.lesser?.value)
println(head.greater?.lesser?.greater?.value)
println(head.greater?.lesser?.greater?.greater?.value)
println(head.greater?.greater?.value)

//head.value = head.greater?.lesser?.value as Int!
//head.greater?.lesser = Node(value: head.greater?.lesser?.greater?.value as Int!)

//head.greater?.lesser = head.greater?.lesser?.greater

head.lesser?.lesser = head.lesser?.lesser?.lesser




println(head.value)
println(head.lesser?.value)
println(head.lesser?.lesser?.value)
println(head.lesser?.greater?.value)
println(head.lesser?.greater?.greater?.value)
println(head.greater?.value)
println(head.greater?.lesser?.value)
println(head.greater?.lesser?.greater?.value)
println(head.greater?.lesser?.greater?.greater?.value)
println(head.greater?.greater?.value)
