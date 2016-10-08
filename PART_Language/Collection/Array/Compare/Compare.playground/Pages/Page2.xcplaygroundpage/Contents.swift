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

let alphabet: NSArray = ["A", "B", "C", "D", "E"]
let lower = ["a", "b", "c", "d", "e"];

var equal = true
if alphabet.count == lower.count {
    for i in 0..<alphabet.count {
        let lhs = alphabet[i] as! NSString
        let rhs = lower[i]
        
        #if swift(>=3.0)
            if lhs.caseInsensitiveCompare(rhs) != .orderedSame {
                equal = false
                break
            }
        #else
            if lhs.caseInsensitiveCompare(rhs) != .OrderedSame {
                equal = false
                break
            }
        #endif
    }
}

if equal {
    print("alphabet == lower")
} else {
    print("alphabet != lower")
}
// alphabet == lower
