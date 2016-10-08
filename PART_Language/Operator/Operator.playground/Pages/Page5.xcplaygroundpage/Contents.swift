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

struct KSize {
    var width = 0.0
    var height = 0.0
}

struct KOffset {
    var x = 0.0
    var y = 0.0
}

enum KSwitch: String {
    case on = "Switch On"
    case off = "Switch Off"
    case auto = "Switch Auto"
}

class KView {
    var origin = KOffset()
    var size = KSize()
}

func == (lhs: KOffset, rhs: KOffset) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

func != (lhs: KOffset, rhs: KOffset) -> Bool {
    return lhs.x != rhs.x || lhs.y != rhs.y
}

func == (lhs: KSize, rhs: KSize) -> Bool {
    return lhs.width == rhs.width && lhs.height == rhs.height
}

func != (lhs: KSize, rhs: KSize) -> Bool {
    return lhs.width != rhs.width || lhs.height != rhs.height
}

func == (lhs: KView, rhs: KView) -> Bool {
    return lhs.origin == rhs.origin && lhs.size == rhs.size
}

func != (lhs: KView, rhs: KView) -> Bool {
    return lhs.origin != rhs.origin || lhs.size != rhs.size
}

var view1 = KView()
var view2 = KView()

if view1 == view2 {
    print("equal")
} else {
    print("not equal")
}
// equal

if view1 === view2 {
    print("Identical")
}
else {
    print("Not Identical")
}
// Not Identical

view2 = view1

if view1 !== view2 {
    print("Not Identical")
}
else {
    print("Identical")
}
// Identical
