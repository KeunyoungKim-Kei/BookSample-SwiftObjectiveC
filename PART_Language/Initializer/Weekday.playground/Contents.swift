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
    
    init?(value: Int) {
        switch value {
        case Weekday.sunday.rawValue:
            self = .sunday
        case Weekday.monday.rawValue:
            self = .monday
        case Weekday.tuesday.rawValue:
            self = .tuesday
        case Weekday.wednesday.rawValue:
            self = .wednesday
        case Weekday.thursday.rawValue:
            self = .thursday
        case Weekday.friday.rawValue:
            self = .friday
        case Weekday.saturday.rawValue:
            self = .saturday
        default:
            return nil
        }
    }
    
    init?(abbr: String) {
        switch abbr {
        case "SUN":
            self = .sunday
        case "MON":
            self = .monday
        case "TUE":
            self = .tuesday
        case "WED":
            self = .wednesday
        case "THU":
            self = .thursday
        case "FRI":
            self = .friday
        case "SAT":
            self = .saturday
        default:
            return nil
        }
    }
}

var validWeekday = Weekday(value: 1)
print(validWeekday)
// Weekday.sunday

validWeekday = Weekday(abbr: "SAT")
print(validWeekday)
// Weekday.saturday

var invalidWeekday = Weekday(value: 1000)
print(invalidWeekday)
// nil

invalidWeekday = Weekday(abbr: "ONE")
print(invalidWeekday)
// nil
