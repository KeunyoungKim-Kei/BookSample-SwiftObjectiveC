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

let productNames: NSArray = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]

#if swift(>=3.0)
let prefixPredicate = NSPredicate(format: "SELF BEGINSWITH %@", "i")
let filteredArray = productNames.filtered(using: prefixPredicate)
#else
    let prefixPredicate = NSPredicate(format: "SELF BEGINSWITH %@", "i")
    let filteredArray = productNames.filteredArrayUsingPredicate(prefixPredicate)
#endif

print(filteredArray)
// ["iPhone", "iPad", "iPad Pro"]

let mutableProductNames = NSMutableArray(array: productNames)

#if swift(>=3.0)
let suffixPredicate = NSPredicate(format: "SELF ENDSWITH %@", "o")
mutableProductNames.filter(using: suffixPredicate)
#else
    let suffixPredicate = NSPredicate(format: "SELF ENDSWITH %@", "o")
    mutableProductNames.filterUsingPredicate(suffixPredicate)
#endif

print(mutableProductNames)
// [""Mac Pro", "iPad Pro", "Macbook Pro"]
