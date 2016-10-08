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

func + (lhs: KSize, rhs: KSize) -> KSize {
    return KSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

func * (lhs: KSize, times: Double) -> KSize {
    return KSize(width: lhs.width * times, height: lhs.height * times)
}

let size1 = KSize(width: 50, height: 100)
let size2 = KSize(width: 100, height: 200)

var newSize = size1 + size2
print(newSize)
// {150.0, 300.0}

newSize = newSize * 2.5
print(newSize)
// {375.0, 750.0}
