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

import Foundation

class Shape: NSObject {
    func draw() {
        print("draw shape")
    }
}

class Rectangle: Shape {
    override func draw() {
        print("draw rectangle")
    }
}

class Square: Rectangle {
    override func draw() {
        print("draw square")
    }
}

class Circle: Shape {
    var radius = 0.0
    
    override func draw() {
        print("draw circle")
    }
    
    func roll() {
        print("rolling circle")
    }
}

let r: AnyObject = Rectangle()

if r is Rectangle {
    print("r is a kind of Rectangle class")
} else {
    print("r is not a kind of Rectangle class")
}
// r is a kind of Rectangle class

if r is Shape {
    print("r is a kind of Shape class")
} else {
    print("r is not a kind of Shape class")
}
// r is a kind of Shape class

if r is NSObjectProtocol {
    print("r conforms to the NSObjectProtocol protocol")
} else {
    print("r doesn't conforms to the NSObjectProtocol protocol")
}
// r conforms to the NSObjectProtocol protocol

if let _ = r.draw?() {
    print("r can respond to draw")
} else {
    print("r cannot respond to draw")
}
// r cannot respond to draw

if let _ = r.length?() {
    print("r can respond to length")
} else {
    print("r cannot respond to length")
}
// r cannot respond to length


