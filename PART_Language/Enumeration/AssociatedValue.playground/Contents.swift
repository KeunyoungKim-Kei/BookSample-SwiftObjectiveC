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

enum DateFormat {
    case long(Int, Int, Int, String)
    case short(Int, Int)
}

let startDate = DateFormat.long(2016, 5, 1, "Sunday")
var endDate = DateFormat.long(2016, 5, 7, "Saturday")
endDate = .short(8, 31)
endDate = .short(9, 2)

switch startDate {
case .long(let year, let month, let day, let weekday):
    print("\(year)-\(month)-\(day) \(weekday)")
case .short(let month, let day):
    print("\(month)-\(day)")
}

// 2016-5-1 Sunday

switch startDate {
case let .long(year, month, day, weekday):
    print("\(year)-\(month)-\(day) \(weekday)")
case .short(let month, _):
    print("\(month)")
}
