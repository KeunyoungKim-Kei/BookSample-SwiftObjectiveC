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

enum Days: Int {
    static var targetLocale = "en"
    static var localizedWeekdayNames: [String] {
        switch Days.targetLocale {
        case "kr":
            return ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
        default:
            return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        }
    }
    
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

let today = Days.friday
let tomorrow = Days.saturday

Days.targetLocale = "us"
print(Days.localizedWeekdayNames[today.rawValue])
print(Days.localizedWeekdayNames[tomorrow.rawValue])
// Friday
// Saturday

Days.targetLocale = "kr"
print(Days.localizedWeekdayNames[today.rawValue])
print(Days.localizedWeekdayNames[tomorrow.rawValue])
// 금요일
// 토요일
