//
//  SwiftDataStructuresTests.swift
//  SwiftDataStructuresTests
//
//  Created by Aybek Can Kaya on 10.04.2021.
//

import XCTest
@testable import SwiftDataStructures

class SwiftDataStructuresTests: XCTestCase {
    private var linkedList = LinkedList<String>()
    private var stack = Stack<Int>()
    private var queue = Queue<String>()
    private var map = Map<String, Int>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

// MARK: Linked List
extension SwiftDataStructuresTests {
    func testLinkedList() {
        linkedList.insert("A")
        linkedList.insert("B")
        linkedList.insert("C")
        
    
    }
}

// MARK: Stack
extension SwiftDataStructuresTests {
    func testStack() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        print(stack.pop())
        print(stack.pop())
        print(stack.pop())
    }
}

// MARK: Queue
extension SwiftDataStructuresTests {
    func testQueue() {
        self.queue.enqueue("Mustafa")
        self.queue.enqueue("Kemal")
        self.queue.enqueue("Atatürk")
        
        print(self.queue.dequeue())
        print(self.queue.dequeue())
        print(self.queue.dequeue())
        print(self.queue.dequeue())
    }
}

// MARK: Map
extension SwiftDataStructuresTests {
    func testMap() {
        self.map.put(key: "A", value: 1)
    }
}
