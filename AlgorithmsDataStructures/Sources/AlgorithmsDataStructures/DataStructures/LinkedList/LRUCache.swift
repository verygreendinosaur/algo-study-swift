//
//  LRUCache.swift
//  
//
//  Created by Christopher Poole on 10/30/20.
//

import Foundation

protocol LRUCacheProtocol {
  
  func peek() -> Int
  func put(_ key: Int, _ value: Int)
  func get(_ key: Int) -> Int
  
}

class LRUCache: LRUCacheProtocol {
  
  var size: Int { nodes.count }
  private var capacity: Int
  private var isCacheFull: Bool { nodes.count > capacity }
  private var list: DoublyLinkedList
  private var nodes: [Int: DoublyLinkedListNode] = [:]
  
  init(capacity: Int) {
    self.capacity = capacity
    list = DoublyLinkedList()
  }
  
  public func peek() -> Int {
    return list.head?.val ?? -1
  }
  
  public func put(_ key: Int, _ value: Int) {
    if let node = nodes[key] {
      node.val = value
      list.delete(node)
      list.addToFront(node)
    } else {
      let node = DoublyLinkedListNode(value, key)
      nodes[key] = node
      list.addToFront(node)
    }
    
    if isCacheFull {
      removeLeastRecentlyUsed()
    }
  }
  
  public func get(_ key: Int) -> Int {
    guard let node = nodes[key], let val = node.val else { return -1 }
    list.delete(node)
    list.addToFront(node)
    
    return val
  }
  
  private func removeLeastRecentlyUsed() {
    if let leastRecentNode = list.tail, let key = leastRecentNode.key {
      nodes.removeValue(forKey: key)
      list.popTail()
    }
  }

}
