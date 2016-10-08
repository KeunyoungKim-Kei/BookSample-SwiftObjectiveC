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

#if swift(>=3.0)
prefix operator **
infix operator ** 
#else
prefix operator ** { }
infix operator ** { }
#endif


prefix func **(size: KSize) -> KSize {
    return KSize(width: size.width * size.width, height: size.height * size.height)
}

func ** (lhs: KSize, rhs: KSize) -> KSize {
    return KSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
}

let size = KSize(width: 10, height: 20)
let newSize = **size
print(newSize)
// newSize: {100.0, 400.0}

let anotherSize = size ** newSize
print(anotherSize)
// anotherSize: {1000.0, 8000.0}

