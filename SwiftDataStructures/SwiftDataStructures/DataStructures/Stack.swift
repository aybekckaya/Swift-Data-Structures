//
//  Stack.swift
//  SwiftDataStructures
//
//  Created by Aybek Can Kaya on 11.04.2021.
//

import Foundation

public class Stack<T> {
    private var linkedList = LinkedList<T>()
    
    var isEmpty: Bool { linkedList.isEmpty }
    
    public func push(_ value: T) {
        linkedList.insert(value)
    }
    
    public func pop() -> T? {
        guard !self.isEmpty, let tail = self.linkedList.tail else { return nil }
        return self.linkedList.delete(tail)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return linkedList.description
    }
}
