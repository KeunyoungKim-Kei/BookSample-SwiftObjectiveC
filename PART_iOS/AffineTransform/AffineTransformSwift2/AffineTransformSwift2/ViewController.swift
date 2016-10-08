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

func radian(degree: Float) -> CGFloat {
    return CGFloat(Double(degree) / 180.0 * M_PI)
}

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addingTransformSwitch: UISwitch!
    @IBOutlet weak var rotationSlider: UISlider!
    @IBOutlet weak var scaleSlider: UISlider!
    @IBOutlet weak var translateXSlider: UISlider!
    @IBOutlet weak var translateYSlider: UISlider!
    var addingTransform = false
    
    @IBAction func rotate(sender: UISlider) {
        if addingTransform {
            imageView.transform = CGAffineTransformRotate(imageView.transform, radian(sender.value))
        } else {
            imageView.transform = CGAffineTransformMakeRotation(radian(sender.value))
        }
    }
    
    @IBAction func scale(sender: UISlider) {
        if addingTransform {
            imageView.transform = CGAffineTransformScale(imageView.transform, CGFloat(sender.value), CGFloat(sender.value))
        } else {
            imageView.transform = CGAffineTransformMakeScale(CGFloat(sender.value), CGFloat(sender.value))
        }
    }
    
    @IBAction func translateX(sender: UISlider) {
        if addingTransform {
            imageView.transform = CGAffineTransformTranslate(imageView.transform, CGFloat(sender.value), 0)
        } else {
            imageView.transform = CGAffineTransformMakeTranslation(CGFloat(sender.value), 0)
        }
    }
    
    @IBAction func translateY(sender: UISlider) {
        if addingTransform {
            imageView.transform = CGAffineTransformTranslate(imageView.transform, 0, CGFloat(sender.value))
        } else {
            imageView.transform = CGAffineTransformMakeTranslation(0, CGFloat(sender.value))
        }
    }
    
    @IBAction func concatAllTransform(sender: AnyObject) {
        imageView.transform = CGAffineTransformIdentity
        
        let rotation = CGAffineTransformMakeRotation(radian(rotationSlider.value))
        let scale = CGAffineTransformMakeScale(CGFloat(scaleSlider.value), CGFloat(scaleSlider.value))
        let translateX = CGAffineTransformMakeTranslation(CGFloat(translateXSlider.value), 0)
        let translateY = CGAffineTransformMakeTranslation(0, CGFloat(translateYSlider.value))
        
        var transform = CGAffineTransformConcat(rotation, scale)
        transform = CGAffineTransformConcat(transform, translateX)
        transform = CGAffineTransformConcat(transform, translateY)
        
        imageView.transform = transform
    }
    
    @IBAction func toggleMethod(sender: UISwitch) {
        addingTransform = sender.on
    }
    
    @IBAction func resetTransform(sender: AnyObject?) {
        rotationSlider.value = 0
        scaleSlider.value = 1
        translateXSlider.value = 0
        translateYSlider.value = 0
        
        addingTransform = false
        addingTransformSwitch.on = addingTransform
        
        // Point #1
        imageView.transform = CGAffineTransformIdentity
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTransform(nil)
    }
}

