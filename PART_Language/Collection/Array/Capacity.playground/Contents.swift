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

var list = ["A", "B", "C"]
print("total: \(list.capacity), current: \(list.count)")
// total: 3, current: 3

list += ["D"]
print("total: \(list.capacity), current: \(list.count)")
// total: 6, current: 4

list += ["E", "F", "G", "H", "I"]
print("total: \(list.capacity), current: \(list.count)")
// total: 12, current: 9

list[1..<6] = ["A"]
print("total: \(list.capacity), current: \(list.count)")
// total: 12, current: 5

var reservedList = [String]()
reservedList.reserveCapacity(100)
print("total: \(reservedList.capacity), current: \(reservedList.count)")
// total: 105, current: 0
