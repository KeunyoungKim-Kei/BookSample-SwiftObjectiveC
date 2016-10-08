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

enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
}

#if swift(>=3.0)
let calendar = NSCalendar.current
let week = Weekday(rawValue: calendar.component(Calendar.Component.weekday, from: Date()))!
#else
let calendar = NSCalendar.currentCalendar()
let week = Weekday(rawValue: calendar.component([.Weekday], fromDate: NSDate()))!
#endif

switch week {
case .sunday:
    print("Today is Sunday")
case .monday:
    print("Today is Monday")
case .tuesday:
    print("Today is Tuesday")
case .wednesday:
    print("Today is Wednesday")
case .thursday:
    print("Today is Thursday")
case .friday:
    print("Today is Friday")
case .saturday:
    print("Today is Saturday")
}

// Today is Wednesday
