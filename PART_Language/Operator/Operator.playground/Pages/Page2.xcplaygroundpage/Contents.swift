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

enum KSwitch: String {
    case on = "Switch On"
    case off = "Switch Off"
    case auto = "Switch Auto"
    
    mutating func push() {
        ++self
    }
}

#if swift(>=3.0)
prefix func ++(s: inout KSwitch) -> KSwitch {
    switch s {
    case KSwitch.on:
        s = KSwitch.off
    case KSwitch.off:
        s = KSwitch.auto
    case KSwitch.auto:
        s = KSwitch.on
    }
    
    return s
}
#else
prefix func ++(inout s: KSwitch) -> KSwitch {
    switch s {
    case KSwitch.on:
        s = KSwitch.off
    case KSwitch.off:
        s = KSwitch.auto
    case KSwitch.auto:
        s = KSwitch.on
    }
    
    return s
}
#endif

var roomSwitch = KSwitch.on
print(roomSwitch.rawValue)
// Switch On

roomSwitch.push()
print(roomSwitch.rawValue)
// Switch Off

roomSwitch.push()
print(roomSwitch.rawValue)
// Switch Auto

roomSwitch.push()
print(roomSwitch.rawValue)
// Switch On
