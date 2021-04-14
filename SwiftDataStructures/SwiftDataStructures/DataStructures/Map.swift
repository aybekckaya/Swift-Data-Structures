//
//  Map.swift
//  SwiftDataStructures
//
//  Created by Aybek Can Kaya on 11.04.2021.
//

import Foundation

public class Map<U: Hashable, T> {
    private var mapDictionary: [U: LinkedList<T>] = [:]
    
    public func put(key: U, value: T) {
        if mapDictionary.keys.contains(key), let list = mapDictionary[key] {
            list.insert(value)
            mapDictionary[key] = list
        } else {
            let list = LinkedList<T>()
            list.insert(value)
            mapDictionary[key] = list
        }
    }
    
    public func clear() {
        self.mapDictionary = [:]
    }
    
    public func removeKey(_ keyDct: U) -> LinkedList<T> {
        var linkedList: LinkedList<T> = LinkedList<T>()
        var newDct: [U: LinkedList<T>] = [:]
        mapDictionary.forEach { (key, value) in
            if key == keyDct {
                linkedList = value
            } else {
                newDct[key] = value
            }
        }
        return linkedList
    }
    
    public func remove(where closure: ( (key: U, value: T) )->(Bool)) -> [T] {
        var valuesDeleted: [T] = []
        mapDictionary.forEach { (key, valueLinkedList) in
            valueLinkedList.iterate { (index, val, node, list) -> (Bool) in
                if closure((key, val)) {
                    valuesDeleted.append(val)
                    let _ = list.delete(node)
                    return true
                }
                return false
            }
        }
        return valuesDeleted
    }
    
    public func values(for key: U) -> [T] {
        guard mapDictionary.keys.contains(key), let linkedList = mapDictionary[key] else { return [] }
        return linkedList.values
    }
    
    public func values() -> [U: [T]] {
        var dct: [U: [T]] = [:]
        mapDictionary.forEach { (key, value) in
            let arrValues = self.values(for: key)
            dct[key] = arrValues
        }
        return dct
    }
    
    public func first(where closure: ((key: U, value: T)) -> (Bool)) -> ListNode<T>? {
        var didFound: Bool = false
        var nodeFound: ListNode<T>? = nil
        var keyIndex: Int = 0
        let dictionaryKeys = Array(mapDictionary.keys)
        while keyIndex < mapDictionary.keys.count && didFound == false {
            let currentKey = dictionaryKeys[keyIndex]
            let currentLinkedList = mapDictionary[currentKey]!
            currentLinkedList.iterate { (index, value, node, list) -> (Bool) in
                if closure((currentKey, value)) == true {
                    nodeFound = node
                    didFound = true
                    return true
                }
                return false
            }
            keyIndex += 1 
        }
        return nodeFound
    }
    
    
    /*
     clear()
     removeWhere()
     valuesForKey
     valuesDictionary
     
    public func first(where ) -> T? {
        
    }
    */
}
