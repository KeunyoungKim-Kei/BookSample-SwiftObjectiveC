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

let alphabet = ["A", "B", "C", "D", "E"]

#if swift(>=3.0)
var result = alphabet.reversed()
#else
    var result = alphabet.reverse()
#endif

print(result)
// ReverseRandomAccessCollection<Array<String>>(_base: ["A", "B", "C", "D", "E"])

#if swift(>=3.0)
var result2: [String] = alphabet.reversed()
#else
    var result2: [String] = alphabet.reverse()
#endif

print(result2)
// ["E", "D", "C", "B", "A"]

#if swift(>=3.0)
result2 = [String](alphabet.reversed())
#else
    result2 = [String](alphabet.reverse())
#endif

print(result2)
// ["E", "D", "C", "B", "A"]
