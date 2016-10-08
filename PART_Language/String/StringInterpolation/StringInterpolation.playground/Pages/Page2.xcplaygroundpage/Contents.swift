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

let intValue = 123
var str = String(format: "value is %ld", intValue)
print(str)
// value is 123

let integerValue: NSInteger = 456
str = String(format: "value is %ld", integerValue)
print(str)
// value is 456

let doubleValue = 12.34
str = String(format: "value is %f", doubleValue)
print(str)
// value is 12.340000

str = String(format: "value is %e", doubleValue)
print(str)
// value is 1.234000e+01

let floatValue: CGFloat = 56.78
str = String(format: "value is %.1f", floatValue)
print(str)
// value is 56.8

#if swift(>=3.0)
let cString = NSString(string: "C String").utf8String!
#else
    let cString = NSString(string: "C String").UTF8String
#endif

str = String(format: "[%-20s]", cString)
print(str)
// [C String            ]

str = String(format: "[%20s]", cString)
print(str)
// [            C String]
