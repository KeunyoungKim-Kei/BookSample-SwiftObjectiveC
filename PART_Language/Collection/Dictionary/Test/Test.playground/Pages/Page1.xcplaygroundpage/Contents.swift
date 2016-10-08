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

#if swift(>=3.0)
let result = words.keysOfEntries(options: [], passingTest: { (key, obj, stop) -> Bool in
    if let value = obj as? String {
        return value.range(of: "a", options: .caseInsensitive) != nil;
    }
    return false
})
    
for keyObj in result {
    if let key = keyObj as? NSString, let value = words[key] {
        print("\(key) - \(value)")
    }
}
#else
let result = words.keysOfEntriesPassingTest { (key, obj, stop) -> Bool in
    if let value = obj as? String {
        return value.rangeOfString("a", options: .CaseInsensitiveSearch) != nil;
    }
    return false
}

for keyObj in result {
    if let key = keyObj as? NSString, value = words[key] {
        print("\(key) - \(value)")
    }
}
#endif

// A - Apple
// B - Banana
