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

let words: NSDictionary = ["A": "Apple", "B": "Banana", "C": "City"]
let anotherWords = ["B": "Banana", "C": "City", "A": "Apple"]
let countryCodes = ["KR": "South Korea", "US": "United States"]

#if swift(>=3.0)
if words.isEqual(to: anotherWords) {
    print("words == anotherWords")
} else {
    print("words != anotherWords")
}
#else
    if words.isEqualToDictionary(anotherWords) {
    print("words == anotherWords")
    } else {
    print("words != anotherWords")
    }
#endif
// words == anotherWords

#if swift(>=3.0)
if words.isEqual(to: countryCodes) {
    print("words == countryCodes")
} else {
    print("words != countryCodes")
}
#else
    if words.isEqualToDictionary(countryCodes) {
    print("words == countryCodes")
    } else {
    print("words != countryCodes")
    }
#endif
// words != countryCodes
