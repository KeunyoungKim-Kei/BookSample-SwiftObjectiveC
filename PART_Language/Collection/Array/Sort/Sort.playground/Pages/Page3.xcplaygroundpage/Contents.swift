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

var alphabet = ["A", "B", "C", "D", "E"]

for i in 0 ..< (alphabet.count - 1) {
    let j = Int(arc4random_uniform(UInt32(alphabet.count - i))) + i
    guard i != j else { continue }
    swap(&alphabet[i], &alphabet[j])
}
print(alphabet)
// ["B", "E", "D", "C", "A"]

#if swift(>=3.0)
    let sortedArray = alphabet.sorted { $0 > $1 }
#else
let sortedArray = alphabet.sort { $0 > $1 }
#endif

print(sortedArray)
// ["E", "D", "C", "B", "A"]

#if swift(>=3.0)
    alphabet.sort { $0 > $1 }
#else
alphabet.sortInPlace { $0 > $1 }
#endif

print(alphabet)
// ["E", "D", "C", "B", "A"]
