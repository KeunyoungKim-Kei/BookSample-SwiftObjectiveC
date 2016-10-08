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

#if swift(>=3.0)
var boolValue = true
let boolObject = NSNumber(value: boolValue)
boolValue = boolObject.boolValue
    
var integerValue = 123
let integerObject = NSNumber(value: integerValue)
integerValue = integerObject.intValue
    
var doubleValue = 12.3
let doubleObject = NSNumber(value: doubleValue)
doubleValue = doubleObject.doubleValue
#else
var boolValue = true
let boolObject = NSNumber(bool: boolValue)
boolValue = boolObject.boolValue

var integerValue = 123
let integerObject = NSNumber(integer: integerValue)
integerValue = integerObject.integerValue

var doubleValue = 12.3
let doubleObject = NSNumber(double: doubleValue)
doubleValue = doubleObject.doubleValue
#endif
