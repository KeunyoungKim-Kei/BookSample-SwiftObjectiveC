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

#if !swift(>=3.0)
class Person {
    var name: String = ""
    var birthDate: NSDate?
    var age: Int {
        get {
            if let date = birthDate {
                let calendar = NSCalendar.currentCalendar()
                let components = calendar.components(NSCalendarUnit.Year, fromDate: date, toDate: NSDate(), options: [])
                return components.year
            }
            
            return -1
        }
        set {
            let calendar = NSCalendar.currentCalendar()
            birthDate = calendar.dateByAddingUnit([.Year], value: newValue * -1, toDate: NSDate(), options: [])
        }
    }
}

let calendar = NSCalendar.currentCalendar()
let componets = NSDateComponents()

componets.year = 1983
componets.month = 3
componets.day = 17

let james = Person()
james.birthDate = calendar.dateFromComponents(componets)
print(james.age)
// 33

james.age = 10
print(james.birthDate)
// 2006-05-03 …
#endif
