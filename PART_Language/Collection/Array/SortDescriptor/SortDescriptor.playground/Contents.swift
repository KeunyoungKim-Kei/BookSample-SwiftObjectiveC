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

var alphabet = NSMutableArray(array: ["A", "B", "C", "D", "E"])

for i in 0 ..< (alphabet.count - 1) {
    let j = Int(arc4random_uniform(UInt32(alphabet.count - i))) + i
    swap(&alphabet[i], &alphabet[j])
}
print(alphabet)
// ["B", "E", "C", "A", "D"]

#if swift(>=3.0)
let asc = NSSortDescriptor(key: "self", ascending: true)
var sortedArray = alphabet.sortedArray(using: [asc])
#else
    let asc = NSSortDescriptor(key: "self", ascending: true)
    var sortedArray = alphabet.sortedArrayUsingDescriptors([asc])
#endif

print(sortedArray)
// ["A", "B", "C", "D", "E"]

#if swift(>=3.0)
let desc = NSSortDescriptor(key: "self", ascending: false)
sortedArray = alphabet.sortedArray(using: [desc])
#else
    let desc = NSSortDescriptor(key: "self", ascending: false)
    sortedArray = alphabet.sortedArrayUsingDescriptors([desc])
#endif

print(sortedArray)
// ["E", "D", "C", "B", "A"]
