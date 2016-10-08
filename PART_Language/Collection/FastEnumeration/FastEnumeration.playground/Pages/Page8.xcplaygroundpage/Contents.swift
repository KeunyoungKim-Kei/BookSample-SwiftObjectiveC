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

var array = ["Apple", "Orange", "Melon", "Apple", "Orange", "Melon"]
var deleteSet = Set<String>()

for value in array {
    if value == "Melon" {
        deleteSet.insert(value)
    }
}

#if swift(>=3.0)
for value in deleteSet {
    var index = array.index(of: value)
    
    while index != nil {
        array.remove(at: index!)
        index = array.index(of: value)
    }
}
#else
for value in deleteSet {
    var index = array.indexOf(value)
    
    while index != nil {
        array.removeAtIndex(index!)
        index = array.indexOf(value)
    }
}
#endif

print(array)
// ["Apple", "Orange", "Apple", "Orange"]
