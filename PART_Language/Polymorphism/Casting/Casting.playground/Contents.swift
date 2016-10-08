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

class Shape {
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

let shape = Shape()
let rect = Rectangle()
let square = Square()
let circle = Circle()

let list = [shape, rect, square, circle]

for element in list {
    if let circle = element as? Circle {
        circle.roll()
    }
}

for element in list {
    element.draw()
}
// draw shape
// draw rectangle
// draw square
// draw circle
