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

prefix func -(offset: KOffset) -> KOffset {
    return KOffset(x: -offset.x, y: -offset.y)
}

let offset = KOffset(x: -100, y: 200)
let newOffset = -offset
print(newOffset)
// {100, -200}

#if swift(>=3.0)
postfix func ++(size: inout KSize) -> KSize {
    let current = size;
    size = KSize(width: size.width + 1, height: size.height + 1)
    return current
}

prefix func ++(size: inout KSize) -> KSize {
    size.width += 1;
    size.height += 1;
    return size;
}
#else
postfix func ++(inout size: KSize) -> KSize {
    let current = size;
    size = KSize(width: size.width + 1, height: size.height + 1)
    return current
}

prefix func ++(inout size: KSize) -> KSize {
    size.width += 1;
    size.height += 1;
    return size;
}
#endif

var boxSize = KSize(width: 100, height: 200)
let newSize = ++boxSize
print(newSize)
print(boxSize)
// newSize: {101.0, 201.0}
// boxSize: {101.0, 201.0}

let anotherSize = boxSize++
print(anotherSize)
print(boxSize)
// anotherSize: {101.0, 201.0}
// boxSize: {102.0, 202.0}
