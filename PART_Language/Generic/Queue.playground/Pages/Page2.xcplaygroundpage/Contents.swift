//
//  Copyright (c) 2016 Keun young Kim <book@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class Node<T> {
    var value: T?
    var prev: Node<T>?
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}


protocol Queueable {
#if swift(>=3.0)
    associatedtype ElementType
#else
    typealias ElementType
#endif
    
    var front: Node<ElementType>? { get set }
    var rear: Node<ElementType>? { get set }
    
    func isEmpty() -> Bool
    func enqueue(_ value: ElementType)
    func dequeue() -> ElementType?
}

class Person {
    var name: String = "John doe"
    var age = 0
}

class PersonDataSource: Queueable {
    typealias ElementType = Person
    
    var length = 0
    var front: Node<Person>? = nil
    var rear: Node<Person>? = nil
    
    func isEmpty() -> Bool {
        return length == 0
    }
    
    func enqueue(_ value: Person) {
        let newNode = Node<Person>(value: value)
        
        if self.isEmpty() {
            self.front = newNode
            self.rear = newNode
        } else {
            if let rear = self.rear {
                newNode.prev = rear;
                rear.next = newNode;
                self.rear = newNode
            }
        }
        
        self.length += 1
    }
    
    func dequeue() -> Person? {
        if self.isEmpty() {
            return nil
        }
        else {
            var ret: Person? = nil
            if let val = self.front?.value {
                ret = val
            }
            
            if self.length == 1 {
                self.front = nil
                self.rear = nil
            }
            else {
                if let node = self.front?.next {
                    node.prev = nil
                    self.front = node
                }
            }
            
            self.length -= 1
            
            return ret
        }
    }
    
    func printDataSource() {
        print("DataSource Length: \(self.length)")
        var node = self.front
        while (node != nil) {
            if let value = node?.value {
                print(value.name)
            }
            
            node = node?.next
        }
    }
}
