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

func radian(_ degree: Double) -> CGFloat {
    return CGFloat(degree / 180.0 * M_PI)
}

@IBDesignable
class DonutChart: UIView {
    @IBInspectable
    var value: CGFloat = 0.0
    
    @IBInspectable
    var chartColor: UIColor = UIColor.yellow

    @IBInspectable
    var chartBackgroundColor: UIColor = UIColor.red
    
    override func draw(_ rect: CGRect) {
        if let ctx = UIGraphicsGetCurrentContext() {
            let radius = (rect.size.width / 2) - 80
            
            let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.width / 2.0)
            ctx.addArc(center: center, radius: radius, startAngle: radian(0), endAngle: CGFloat(M_PI * 2.0), clockwise: false)
            chartBackgroundColor.set()
            ctx.setLineWidth(60)
            ctx.drawPath(using: CGPathDrawingMode.stroke)
            
            ctx.addArc(center: center, radius: radius, startAngle: radian(-90), endAngle: radian(360 * Double(value)) + radian(-90), clockwise: false)
            chartColor.set()
            ctx.setLineWidth(60)
            ctx.drawPath(using: CGPathDrawingMode.stroke)
        }
    }
    
//    override func prepareForInterfaceBuilder() {
//        value = 0.6
//    }
}
