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

struct Color<T: Equatable>: Equatable {
    var red: T
    var green: T
    var blue: T
}

#if swift(>=3.0)
func compare<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}
#else
func compare<T: Equatable>(lhs lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}
#endif

func ==<T>(lhs: Color<T>, rhs: Color<T>) -> Bool {
    return lhs.red == rhs.red && lhs.green == rhs.green && lhs.blue == rhs.blue
}

let black = Color(red: 0, green: 0, blue: 0)
let white = Color(red: 255, green: 255, blue: 255)
let result = compare(lhs: black, rhs: white)
// false
