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

func radian(degree: Double) -> CGFloat {
    return CGFloat(degree / 180.0 * M_PI)
}

@IBDesignable
class DonutChart: UIView {    
    @IBInspectable
    var value: CGFloat = 0.0
    
    @IBInspectable
    var chartColor: UIColor = UIColor.yellowColor()

    @IBInspectable
    var chartBackgroundColor: UIColor = UIColor.redColor()
    
    override func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()!
        let radius = (rect.size.width / 2) - 80
        
        CGContextAddArc(ctx, rect.size.width / 2.0, rect.size.height / 2.0, radius, 0, CGFloat(M_PI * 2.0), 0)
        chartBackgroundColor.set()
        CGContextSetLineWidth(ctx, 60)
        CGContextDrawPath(ctx, CGPathDrawingMode.Stroke)
        
        CGContextAddArc(ctx, rect.size.width / 2.0, rect.size.height / 2.0, radius, radian(-90), radian(360 * Double(value)) + radian(-90), 0)
        chartColor.set()
        CGContextSetLineWidth(ctx, 60)
        CGContextDrawPath(ctx, CGPathDrawingMode.Stroke)
    }
    
//override func prepareForInterfaceBuilder() {
//    value = 0.6
//}
}
