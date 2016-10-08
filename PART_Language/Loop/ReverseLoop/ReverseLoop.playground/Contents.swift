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

let list = ["One", "Two", "Three"]
#if swift(>=3.0)
for str in list.reversed() {
    print(str)
}
#else
    for str in list.reverse() {
    print(str)
    }
#endif
// Three
// Two
// One

let str = "One"

#if swift(>=3.0)
for ch in str.characters.reversed() {
    print(ch)
}
#else
    for ch in str.characters.reverse() {
    print(ch)
    }
#endif
// e
// n
// O

#if swift(>=3.0)
for index in (2..<6).reversed() {
    print(index)
}
#else
    for index in (2..<6).reverse() {
    print(index)
    }
#endif
// 5
// 4
// 3
// 2
