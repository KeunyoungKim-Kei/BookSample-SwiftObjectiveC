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

#if swift(>=3.0)
let pointObject = NSValue(cgPoint: CGPoint(x: 100, y: 200))
let sizeObject = NSValue(cgSize: CGSize(width: 100, height: 200))
    
if (pointObject.isEqual(to: sizeObject)) {
    print("\(pointObject) == \(sizeObject)")
} else {
    print("\(pointObject) != \(sizeObject)")
}
    // NSPoint: {100, 200} != NSSize: {100, 200}
#else
let pointObject = NSValue(CGPoint: CGPoint(x: 100, y: 200))
let sizeObject = NSValue(CGSize: CGSize(width: 100, height: 200))

if (pointObject.isEqualToValue(sizeObject)) {
    print("\(pointObject) == \(sizeObject)")
} else {
    print("\(pointObject) != \(sizeObject)")
}
// NSPoint: {100, 200} != NSSize: {100, 200}
#endif
