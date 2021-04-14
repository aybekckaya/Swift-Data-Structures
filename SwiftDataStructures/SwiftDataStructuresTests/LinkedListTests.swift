//
//  LinkedListTests.swift
//  SwiftDataStructuresTests
//
//  Created by Aybek Can Kaya on 11.04.2021.
//

/**
  Cases :
 Tail and head should be nil at initialization phase
 After first insertion , head and tail should be equal and not nil
 After some insertions , iterated values should be same in given order
 Find gives result of all searched elements
 First where should find given value in a minimum amount of iterations
 deleting node
 deleting node in given condition
 Clear should delete all inserted items
 
 */


import XCTest
@testable import SwiftDataStructures

class LinkedListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

// MARK: Initialize
extension LinkedListTests {
    func test1InitializeLinkedList() {
        let list = LinkedList<Int>()
        XCTAssert(list.head == nil, "Head should be nil. Value: \(String(describing: list.head))")
        XCTAssert(list.tail == nil, "Tail should be nil. Value: \(String(describing: list.tail))")
        XCTAssert(list.values.isEmpty == true, "There should be no values. Value: \(list.values)")
    }
}

// MARK: Insertion
extension LinkedListTests {
    func test2TailAndHeadShouldBeEqual() {
        let val: Int = 12
        let list = LinkedList<Int>()
        list.insert(val)
        XCTAssert(list.head?.value == 12, "Head should be \(val). Value: \(String(describing: list.head?.value))")
        XCTAssert(list.tail?.value == 12, "Tail should be \(val). Value: \(String(describing: list.tail?.value))")
        XCTAssert(list.values.first == 12, "There should be 1 node and its value should be : \(val). Value: \(String(describing: list.values.first))")
    }
    
    func test3InsertedValuesShouldBeIteratedInGivenOrder() {
        var arrListValues: [Int] = []
        let given: [Int] = [1, 2, 3]
        let list = LinkedList<Int>()
        given.forEach { list.insert($0) }
        list.iterate { (index, value, node, linkedList) -> (Bool) in
            arrListValues.append(value)
            return false
        }
        checkValuesSame(valuesLeft: given, valuesRight: arrListValues, isOrdered: true)
        
    }
}

// MARK: Helpers
fileprivate protocol ComparableValues {
    
}

extension LinkedListTests {
    private func checkValuesSame<T>(valuesLeft: [T], valuesRight: [T], isOrdered: Bool)  {
        if valuesLeft.count != valuesRight.count {
            XCTFail("Count are not equal. Left : \(valuesLeft.count), Right: \(valuesRight.count)")
            return
        }
        for index in 0 ..< valuesLeft.count {
            let leftValue = valuesLeft[index]
            let rightValue = valuesRight[index]
            XCTAssert(leftValue == rightValue, "Left and Right values are not equal. Left: \(leftValue) , Right: \(rightValue)")
        }
    }
}
