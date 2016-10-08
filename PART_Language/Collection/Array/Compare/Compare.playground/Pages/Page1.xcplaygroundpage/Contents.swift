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

let alphabet: NSArray = ["A", "B", "C", "D", "E"]
let upper = ["A", "B", "C", "D", "E"];
let shuffled = ["E", "B", "C", "A", "D"];
let lower = ["a", "b", "c", "d", "e"];
let mixed = ["A", "b", "C", "d", "e"];

#if swift(>=3.0)
if alphabet.isEqual(to: upper) {
    print("alphabet == upper")
} else {
    print("alphabet != upper")
}
    
if alphabet.isEqual(to: shuffled) {
    print("alphabet == shuffled")
} else {
    print("alphabet != shuffled")
}
    
if alphabet.isEqual(to: lower) {
    print("alphabet == lower")
} else {
    print("alphabet != lower")
}
    
if alphabet.isEqual(to: mixed) {
    print("alphabet == mixed")
} else {
    print("alphabet != mixed")
}
#else
    if alphabet.isEqualToArray(upper) {
    print("alphabet == upper")
    } else {
    print("alphabet != upper")
    }
    
    if alphabet.isEqualToArray(shuffled) {
    print("alphabet == shuffled")
    } else {
    print("alphabet != shuffled")
    }
    
    if alphabet.isEqualToArray(lower) {
    print("alphabet == lower")
    } else {
    print("alphabet != lower")
    }
    
    if alphabet.isEqualToArray(mixed) {
    print("alphabet == mixed")
    } else {
    print("alphabet != mixed")
    }
#endif

// alphabet == upper
// alphabet != shuffled
// alphabet != lower
// alphabet != mixed
