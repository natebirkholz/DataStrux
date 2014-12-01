// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Node {
  var value : Int
  var lesser : Node?
  var greater : Node?

  init (valueForNode: Int) {
    value = valueForNode
    println("Initialized with value: \(value)")
  }

}

class BinaryTree {
  var head : Node?
  let noVal = "Value not found"

  func addValue (valueToAdd: Int) {
    if head?.value == nil {
      head = Node(valueForNode: valueToAdd) as Node!
    } else {
      findPositionToAddNode (head!, valueToAdd: valueToAdd)
    }
  }

  func findPositionToAddNode (currentNode: Node, valueToAdd: Int) {
    if valueToAdd == currentNode.value {
      println("--duplicate node--")
    } else if valueToAdd < currentNode.value {
      if currentNode.lesser?.value == nil {
        currentNode.lesser = Node(valueForNode: valueToAdd) as Node!
      } else {
        findPositionToAddNode(currentNode.lesser!, valueToAdd: valueToAdd)
      }
    } else if valueToAdd > currentNode.value {
      if currentNode.greater?.value == nil {
        currentNode.greater = Node(valueForNode: valueToAdd) as Node!
      } else {
        findPositionToAddNode(currentNode.greater!, valueToAdd: valueToAdd)
      }
    }
  }

  func findValue(valueToFind: Int) {
    if head?.value == nil {
      println(noVal)
    } else {
      findLocationOfValueForNode(head!, valueToFind: valueToFind)
    }
  }

  private func findLocationOfValueForNode (currentNode: Node, valueToFind: Int) {
    if currentNode.value == valueToFind {
      println("Found a node with value \(currentNode.value) matching search value \(valueToFind)")
    } else if valueToFind < currentNode.value {
      if currentNode.lesser?.value == nil {
        println(noVal)
      } else {
        findLocationOfValueForNode(currentNode.lesser!, valueToFind: valueToFind)
      }
    } else if valueToFind > currentNode.value {
      if currentNode.greater?.value == nil {
        println(noVal)
      } else {
        findLocationOfValueForNode(currentNode.greater!, valueToFind: valueToFind)
      }
    }
  }

  func removeValue (valueToRemove: Int) {
    println(__FUNCTION__)
    if head?.value == nil { // Head is nil
      println(noVal)
    } else if head?.value == valueToRemove { // Head is Value
      println("head Value \(head?.value) matches search value \(valueToRemove)")
      var newValue = findValueToReplaceRemovedNode(head!)
      if newValue == head?.value {
        println("removing head")
        head = head?.lesser
      } else {
        println("head.value is \(head?.value) and newValeu is \(newValue)")
        head?.value = newValue
        println("head.value is now \(head?.value)")
      }

    } else if valueToRemove < head?.value { // Value less than head
      if head?.lesser? == nil {
        println(noVal)
      } else {
        let nextNode = head?.lesser as Node!
        findNodeToRemoveWithValue(valueToRemove, currentSearchNode: nextNode, parentNode: head!)
      }
    } else if valueToRemove > head?.value { // Value greater than head
      if head?.greater? == nil {
        println(noVal)
      } else {
        let nextNode = head?.greater as Node!
        findNodeToRemoveWithValue(valueToRemove, currentSearchNode: nextNode, parentNode: head!)
      }
    }
  }

  private func findNodeToRemoveWithValue (valueToRemove: Int, currentSearchNode: Node, parentNode: Node) {
    println(__FUNCTION__)

    if currentSearchNode.value == valueToRemove { // Node is Value
      println("removing \(currentSearchNode.value)")
      var newValue = findValueToReplaceRemovedNode(currentSearchNode)
      println("new value is \(newValue)")
      if currentSearchNode.value ==  newValue {
        println("remove self")
        if parentNode.lesser?.value == currentSearchNode.value {
          parentNode.lesser = currentSearchNode.lesser
        } else if parentNode.greater?.value == currentSearchNode.value {
          parentNode.greater = currentSearchNode.greater
        }
      } else {
        println("replacing current value \(currentSearchNode.value) with new value: \(newValue)")
        currentSearchNode.value = newValue
        println("the value is now \(currentSearchNode.value)")
      }
    } else if valueToRemove < currentSearchNode.value { // Value less than Node
      if currentSearchNode.lesser? == nil {
        println(noVal)
      } else {
        let nextNode = currentSearchNode.lesser as Node!
        findNodeToRemoveWithValue(valueToRemove, currentSearchNode: nextNode, parentNode: currentSearchNode)
      }
    } else if valueToRemove > currentSearchNode.value { // Value greater than Node
      if currentSearchNode.greater? == nil {
        println(noVal)
      } else {
        let nextNode = currentSearchNode.greater as Node!
        findNodeToRemoveWithValue(valueToRemove, currentSearchNode: nextNode, parentNode: currentSearchNode)
      }
    }

  }



  private func findValueToReplaceRemovedNode (nodeToRemove: Node) -> (Int) {
    println(__FUNCTION__)

    var valueFor: Int?
    if nodeToRemove.lesser? == nil && nodeToRemove.greater? == nil {
      println("no children found for removed node")
      valueFor = nodeToRemove.value
      return valueFor as Int!
    } else if nodeToRemove.greater != nil {
      let greaterTreeValue = findLowestGreaterChildOfNode(nodeToRemove)
      valueFor = greaterTreeValue
      return valueFor as Int!
    } else {
      let lesserTreeValue = findHighestLesserChildOfNode(nodeToRemove)
      valueFor = lesserTreeValue
      return valueFor as Int!
    }
    return valueFor as Int!
  }

  private func findHighestLesserChildOfNode(nodeToRemove: Node) -> Int {
    println(__FUNCTION__)

    var valueFor : Int?
    var parentNode = nodeToRemove
    var lesserNode = nodeToRemove.lesser? as Node!
    if lesserNode.greater? == nil {
      let valueToReturn = lesserNode.value
      parentNode.lesser = parentNode.lesser?.lesser
      valueFor = valueToReturn
    } else {
      var valueToReturn = findHighestChild(lesserNode.greater!, parentNode: lesserNode)
      valueFor = valueToReturn
      // return the value and make greaterNode.greater the .greater of the parent
    }
    return valueFor as Int!
  }
// MAKE SURE TE GREATER NODE IS EVALUATED AS PRESENT BEFORE THIS
  private func findLowestGreaterChildOfNode(nodeToRemove: Node) -> Int {
    println(__FUNCTION__)

    var valueFor : Int?
    var parentNode = nodeToRemove
    var greaterNode = nodeToRemove.greater? as Node!
    if greaterNode.lesser? == nil {
      let valueToReturn = greaterNode.value
      println("parentNode.greater is currently \(parentNode.greater?.value) and parentNode.greater.greater is \(parentNode.greater?.greater?.value)")
      parentNode.greater = parentNode.greater?.greater
      println("parentNode.greater is now \(parentNode.greater?.value) and parentNode.greater.greater is \(parentNode.greater?.greater?.value)")
      valueFor = valueToReturn
      } else {
      var valueToReturn = findLowestChild(greaterNode.lesser!, parentNode: greaterNode)
      valueFor = valueToReturn
      }
    return valueFor as Int!
    }


  private func findLowestChild (evalNode: Node, parentNode: Node) -> Int {
    println(__FUNCTION__)
    println("--evalNode is \(evalNode.value) and parentNode is \(parentNode.value)")
    println("--evalNode.lesser is \(evalNode.lesser?.value) and parentNode.lesser is \(parentNode.lesser?.value)")
    var valueFor : Int?

    if evalNode.lesser? == nil && evalNode.greater? == nil {
      println("this is a leaf")
      let valueToReturn = evalNode.value
      println("value to return is \(valueToReturn)")
      parentNode.lesser = parentNode.lesser?.lesser
      valueFor = valueToReturn as Int!

    } else if evalNode.lesser? == nil && evalNode.greater? != nil {
      println("this node branches right")
      let valueToReturn = evalNode.value
      parentNode.lesser = parentNode.lesser?.greater
      valueFor = valueToReturn

    } else {
      println("still looking down")
      valueFor = findLowestChild(evalNode.lesser!, parentNode: parentNode.lesser!)
    }
    return valueFor as Int!

  }

  private func findHighestChild (evalNode: Node, parentNode: Node) -> Int {
    println(__FUNCTION__)

    var valueFor : Int?
    if evalNode.greater? == nil && evalNode.lesser? == nil {
      let valueToReturn = evalNode.value
      parentNode.greater = parentNode.greater?.greater
      valueFor = valueToReturn
    } else if evalNode.lesser? == nil && evalNode.greater? != nil {
      let valueToReturn = evalNode.value
      parentNode.greater = parentNode.greater?.lesser
      valueFor = valueToReturn
    } else {
      valueFor = findHighestChild (evalNode.greater!, parentNode: parentNode.greater!)
    }
    return valueFor as Int!

  }

}



var bTree = BinaryTree()
var cTree = BinaryTree()


var nodeArray : [Int] = [105, 50, 40, 30, 35, 60, 55, 54, 56, 65, 64, 66, 120, 110, 107, 106, 108, 109, 115, 113, 112, 114, 116, 140]
for (value : Int) in nodeArray {
  bTree.addValue(value)
}

bTree.findValue(113)
bTree.removeValue(140)
bTree.removeValue(120)






