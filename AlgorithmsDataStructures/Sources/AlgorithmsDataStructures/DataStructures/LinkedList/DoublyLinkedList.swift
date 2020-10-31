//
//  DoublyLinkedList.swift
//  
//
//  Created by Christopher Poole on 10/30/20.
//

import Foundation

class DoublyLinkedListNode {
  
  var prev: DoublyLinkedListNode?
  var next: DoublyLinkedListNode?
  var val: Int?
  
  init(_ val: Int?) {
    self.val = val
  }
  
}

class DoublyLinkedList {
  
  private var dummyHead: DoublyLinkedListNode
  private var dummyTail: DoublyLinkedListNode
  var head: DoublyLinkedListNode? { dummyHead.next === dummyTail ? nil : dummyHead.next }
  var tail: DoublyLinkedListNode? { dummyTail.prev === dummyHead ? nil : dummyTail.prev }
  
  init() {
    dummyHead = DoublyLinkedListNode(nil)
    dummyTail = DoublyLinkedListNode(nil)
    dummyHead.next = dummyTail
    dummyTail.prev = dummyHead
  }
  
  public func traverse(handler: (DoublyLinkedListNode) -> Void) {
    var node = head
    
    while let validNode = node, validNode.val != nil {
      handler(validNode)
      node = validNode.next
    }
  }
  
  public func traverseReverse(handler: (DoublyLinkedListNode) -> Void) {
    var node = tail
    
    while let validNode = node, validNode.val != nil {
      handler(validNode)
      node = validNode.prev
    }
  }
  
  public func addToFront(_ val: Int) {
    insert(DoublyLinkedListNode(val), after: dummyHead)
  }
  
  public func addAfter(_ val: Int, node: DoublyLinkedListNode) {
    insert(DoublyLinkedListNode(val), after: node)
  }
  
  public func addBefore(_ val: Int, node: DoublyLinkedListNode) {
    insert(DoublyLinkedListNode(val), before: node)
  }
  
  public func addToTail(_ val: Int) {
    insert(DoublyLinkedListNode(val), before: dummyTail)
  }
  
  public func popTail() -> DoublyLinkedListNode? {
    return remove(tail)
  }
  
  private func insert(_ node: DoublyLinkedListNode, after existingNode: DoublyLinkedListNode) {
    let oldNext = existingNode.next
    
    // Set next on preceding node
    existingNode.next = node
    
    // Set prev, next on new node
    node.next = oldNext
    node.prev = existingNode
    
    // Set prev on former next node
    oldNext?.prev = node
  }
  
  private func insert(_ node: DoublyLinkedListNode, before existingNode: DoublyLinkedListNode) {
    let oldPrev = existingNode.prev
    
    // Set prev on preceding node
    existingNode.prev = node
    
    // Set prev, next on new node
    node.next = existingNode
    node.prev = oldPrev
    
    // Set next on former prev node
    oldPrev?.next = node
  }
  
  private func remove(_ node: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
    guard let node = node else { return nil }
    // node before node to remove
    let beforeNode = node.prev
    
    // node after node to remove
    let afterNode = node.next
    
    // point before node <-> after node
    beforeNode?.next = afterNode
    afterNode?.prev = beforeNode
    
    return node
  }
  
}
