//
//  LinkedList.swift
//  SwiftDataStructures
//
//  Created by Aybek Can Kaya on 10.04.2021.
//

import Foundation

// MARK: List Node
public class ListNode<T> {
    private(set) var value: T
    weak var previous: ListNode<T>?
    var next: ListNode<T>?
   
    init(_ val: T) {
        self.value = val
    }
}

// MARK: Linked List
public class LinkedList<T> {
    private(set) var head: ListNode<T>?
    private(set) var tail: ListNode<T>?
    
    public var isEmpty: Bool { head == nil }
    
    public var values: [T] {
        var arrValues: [T] = []
        self.iterate { (index, value, node, list) -> (Bool) in
            arrValues.append(value)
            return false
        }
        return arrValues
    }
    
    public func insert(_ value: T) {
        let node = ListNode(value)
        if tail == nil {
            head = node
            tail = node
        } else {
            node.previous = tail
            tail?.next = node
            tail = node
        }
    }
    
    public func clear() {
        self.tail = nil
        self.head = nil
    }
    
    public func iterate(callback: ( (index: Int, value: T, node: ListNode<T>, linkedList: LinkedList) ) -> (Bool) ) {
        var node = head
        var index: Int = 0
        var shouldStop: Bool = false
        while node != nil && shouldStop == false {
            let tuple = (index, node!.value, node!, self)
            if callback(tuple) {
                shouldStop = true
            } else {
                node = node?.next
                index += 1
            }
        }
    }
    
    public func find(callback: ( (index: Int, value: T, node: ListNode<T>) ) -> (Bool)) -> [T] {
        var node = head
        var foundNodes: [T] = []
        var index: Int = 0
        while node != nil {
            let tuple = (index, node!.value, node!)
            if callback(tuple) {
                foundNodes.append(node!.value)
            }
            node = node?.next
            index += 1
        }
        return foundNodes
    }
    
    public func first(where callback: ( (index: Int, value: T, node: ListNode<T>) ) -> (Bool)) -> ListNode<T>? {
        var node = head
        var foundNode: ListNode<T>?
        var index: Int = 0
        var didFound: Bool = false
        while node != nil && didFound == false {
            let tuple = (index, node!.value, node!)
            if callback(tuple) {
                didFound = true
                foundNode = node
            } else {
                node = node?.next
                index += 1
            }
        }
        return foundNode
    }
    
    public func delete(where closure: ( (index: Int, value: T, node: ListNode<T>) ) -> (Bool)) -> [ListNode<T>] {
        var nodesToDelete: [ListNode<T>] = []
        self.iterate { (index, value, node, list) -> (Bool) in
            if closure((index, value, node)) {
                nodesToDelete.append(node)
                let _ = self.delete(node)
            }
            return false 
        }
        return nodesToDelete
    }
    
    public func delete(_ node: ListNode<T>) -> T {
        if let prev = node.previous {
            prev.next = node.next
        } else {
            head = node.next
        }
        node.next?.previous = node.previous
        if node.next == nil {
            tail = node.previous
        }
        node.previous = nil
        node.next = nil
        return node.value
    }
}

// MARK: Printer
extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text: String = ""
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text
    }
}
