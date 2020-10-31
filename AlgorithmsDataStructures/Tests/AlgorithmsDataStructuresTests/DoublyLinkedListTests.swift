//
//  DoublyLinkedListTests.swift
//  AlgorithmsDataStructuresTests
//
//  Created by Christopher Poole on 10/30/20.
//

import XCTest
@testable import AlgorithmsDataStructures

final class DoublyLinkedListTests: XCTestCase {
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
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
  
}
