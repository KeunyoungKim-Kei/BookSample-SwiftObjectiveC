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

let rangeValue = NSRange(location: 0, length: 7)
let rangeObject = NSValue(range: rangeValue)

let unboxedRangeValue = rangeObject.rangeValue
print(NSStringFromRange(unboxedRangeValue))
// {0, 7}

#if swift(>=3.0)
    // CGPoint
var ptValue = CGPoint(x: 100.0, y: 200.0)
let pointObject = NSValue(cgPoint: ptValue)
ptValue = pointObject.cgPointValue
    
    // CGVector
var vectorValue = CGVector(dx: 100.0, dy: 200.0)
let vectorObject = NSValue(cgVector: vectorValue)
vectorValue = vectorObject.cgVectorValue
    
    // CGSize
var sizeValue = CGSize(width: 100.0, height: 200.0)
let sizeObject = NSValue(cgSize: sizeValue)
sizeValue = sizeObject.cgSizeValue
    
    // CGRect
var rectValue = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
let rectObject = NSValue(cgRect: rectValue)
rectValue = rectObject.cgRectValue
    
    // CGAffineTransform
var atValue = CGAffineTransform.identity
let atObject = NSValue(cgAffineTransform: atValue)
atValue = atObject.cgAffineTransformValue
    
    // UIEdgeInsets
var insetsValue = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
let insetsObject = NSValue(uiEdgeInsets: insetsValue)
insetsValue = insetsObject.uiEdgeInsetsValue
#else
    // CGPoint
    var ptValue = CGPoint(x: 100.0, y: 200.0)
let pointObject = NSValue(CGPoint: ptValue)
ptValue = pointObject.CGPointValue()

// CGVector
var vectorValue = CGVector(dx: 100.0, dy: 200.0)
let vectorObject = NSValue(CGVector: vectorValue)
vectorValue = vectorObject.CGVectorValue()

// CGSize
var sizeValue = CGSize(width: 100.0, height: 200.0)
let sizeObject = NSValue(CGSize: sizeValue)
sizeValue = sizeObject.CGSizeValue()

// CGRect
var rectValue = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 200.0)
let rectObject = NSValue(CGRect: rectValue)
rectValue = rectObject.CGRectValue()

// CGAffineTransform
var atValue = CGAffineTransformIdentity
let atObject = NSValue(CGAffineTransform: atValue)
atValue = atObject.CGAffineTransformValue()

// UIEdgeInsets
var insetsValue = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
let insetsObject = NSValue(UIEdgeInsets: insetsValue)
insetsValue = insetsObject.UIEdgeInsetsValue()
#endif
