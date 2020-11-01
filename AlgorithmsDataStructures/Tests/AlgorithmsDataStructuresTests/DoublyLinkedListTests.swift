//
//  DoublyLinkedListTests.swift
//  AlgorithmsDataStructuresTests
//
//  Created by Christopher Poole on 10/30/20.
//

import XCTest
@testable import AlgorithmsDataStructures

final class DoublyLinkedListTests: XCTestCase {
  
  func testConstructor() {
    // When
    var list = DoublyLinkedList()
    
    // Then
    XCTAssertNil(list.head)
    XCTAssertNil(list.tail)
  }
  
  func test_addToFrontAndAddToTail() {
    // When
    var list = DoublyLinkedList()
    
    // When
    list.addToFront(1)
    
    // Then
    XCTAssertNotNil(list.head)
    XCTAssertNotNil(list.tail)
    XCTAssertEqual(list.head!.val, 1)
    XCTAssertEqual(list.tail!.val, 1)
    
    // When
    list = DoublyLinkedList()
    list.addToTail(1)
    
    // Then
    XCTAssertNotNil(list.head)
    XCTAssertNotNil(list.tail)
    XCTAssertEqual(list.head!.val, 1)
    XCTAssertEqual(list.tail!.val, 1)
    
    // When
    list = DoublyLinkedList()
    list.addToFront(2)
    list.addToTail(3)
    list.addToFront(1)
    list.addToTail(4)
    list.addToTail(5)
    var nodeVals: [Int] = []
    var nodeValsReverse: [Int] = []
    list.traverse { nodeVals.append($0.val!) }
    list.traverseReverse { nodeValsReverse.append($0.val!) }
    
    // Then
    XCTAssertNotNil(list.head)
    XCTAssertNotNil(list.tail)
    XCTAssertEqual(list.head!.val, 1)
    XCTAssertEqual(list.tail!.val, 5)
    XCTAssertEqual(nodeVals, [1,2,3,4,5])
    XCTAssertEqual(nodeValsReverse, [5,4,3,2,1])
    
    // When
    list = DoublyLinkedList()
    list.addToFront(5)
    list.addToFront(4)
    list.addToFront(3)
    list.addToFront(2)
    list.addToFront(1)
    
    XCTAssertEqual(list.popTail()!.val, 5)
    XCTAssertEqual(list.tail!.val, 4)
    
    XCTAssertEqual(list.popTail()!.val, 4)
    XCTAssertEqual(list.tail!.val, 3)
    
    XCTAssertEqual(list.popTail()!.val, 3)
    XCTAssertEqual(list.tail!.val, 2)
    
    XCTAssertEqual(list.popTail()!.val, 2)
    XCTAssertEqual(list.tail!.val, 1)

    XCTAssertEqual(list.popTail()!.val, 1)
    XCTAssertNil(list.tail)
  }
  
  func test_addBeforeAndAfter() {
    // When
    var list = DoublyLinkedList()
    list.addToFront(1)
    list.addToTail(5)
    list.addAfter(2, node: list.head!)
    list.addBefore(4, node: list.tail!)

    var nodeVals: [Int] = []
    list.traverse { nodeVals.append($0.val!) }
    
    // Then
    XCTAssertNotNil(list.head)
    XCTAssertNotNil(list.tail)
    XCTAssertEqual(list.head!.val, 1)
    XCTAssertEqual(list.tail!.val, 5)
    XCTAssertEqual(nodeVals, [1,2,4,5])
  }
  
  func testTraverse() {
    // When
    let list = DoublyLinkedList()
    list.addToFront(2)
    list.addToTail(3)
    list.addToFront(1)
    list.addToTail(4)
    list.addToTail(5)
    
    var nodeVals: [Int] = []
    var nodeValsReverse: [Int] = []
    list.traverse { nodeVals.append($0.val!) }
    list.traverseReverse { nodeValsReverse.append($0.val!) }
    
    // Then
    XCTAssertEqual(nodeVals, [1,2,3,4,5])
    XCTAssertEqual(nodeValsReverse, [5,4,3,2,1])
  }
  
  func testLRUCache() {
    // When
    let lruCache = LRUCache(capacity: 3)
    
    lruCache.put(3, 3)
    lruCache.put(2, 2)
    lruCache.put(1, 1)
    
    // Then
    XCTAssertEqual(lruCache.peek(), 1)
    XCTAssertEqual(lruCache.get(3), 3)
    XCTAssertEqual(lruCache.peek(), 3)
    lruCache.put(2, 20)
    XCTAssertEqual(lruCache.peek(), 20)
    lruCache.put(4, 4)
    XCTAssertEqual(lruCache.size, 3)
    lruCache.put(5, 5)
    XCTAssertEqual(lruCache.size, 3)
    lruCache.put(6, 5)
    XCTAssertEqual(lruCache.size, 3)
  }
  
}
