//
//  Queue.swift
//  SwiftDataStructures
//
//  Created by Aybek Can Kaya on 11.04.2021.
//

import Foundation

public class Queue<T> {
    private var linkedList = LinkedList<T>()
    
    public func enqueue(_ value: T) {
        linkedList.insert(value)
    }
    
    public func dequeue() -> T? {
        guard !linkedList.isEmpty, let tail = linkedList.tail else { return nil }
        return linkedList.delete(tail)
    }
}
