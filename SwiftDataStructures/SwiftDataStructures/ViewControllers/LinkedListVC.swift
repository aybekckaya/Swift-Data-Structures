//
//  LinkedListVC.swift
//  SwiftDataStructures
//
//  Created by Aybek Can Kaya on 10.04.2021.
//

import Foundation
import UIKit

// MARK: Linked List {Class}
class LinkedListVC: UIViewController {
    private var linkedList = LinkedList<String>()
}

// MARK: Lifecycle
extension LinkedListVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
    }
}
