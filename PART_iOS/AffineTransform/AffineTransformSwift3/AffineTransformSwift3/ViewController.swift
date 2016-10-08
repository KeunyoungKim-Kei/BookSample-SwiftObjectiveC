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

func radian(_ degree: Float) -> CGFloat {
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
            imageView.transform = imageView.transform.rotated(by: radian(sender.value))
        } else {
            imageView.transform = CGAffineTransform(rotationAngle: radian(sender.value))
        }
    }
    
    @IBAction func scale(sender: UISlider) {
        if addingTransform {
            imageView.transform = imageView.transform.scaledBy(x: CGFloat(sender.value), y: CGFloat(sender.value))
        } else {
            imageView.transform = CGAffineTransform(scaleX: CGFloat(sender.value), y: CGFloat(sender.value))
        }
    }
    
    @IBAction func translateX(sender: UISlider) {
        if addingTransform {
            imageView.transform = imageView.transform.translatedBy(x: CGFloat(sender.value), y: 0)
        } else {
            imageView.transform = CGAffineTransform(translationX: CGFloat(sender.value), y: 0)
        }
    }
    
    @IBAction func translateY(sender: UISlider) {
        if addingTransform {
            imageView.transform = imageView.transform.translatedBy(x: 0, y: CGFloat(sender.value))
        } else {
            imageView.transform = CGAffineTransform(translationX: 0, y: CGFloat(sender.value))
        }
    }
    
    @IBAction func concatAllTransform(sender: AnyObject) {
        imageView.transform = CGAffineTransform.identity
        
        let rotation = CGAffineTransform(rotationAngle: radian(rotationSlider.value))
        let scale = CGAffineTransform(scaleX: CGFloat(scaleSlider.value), y: CGFloat(scaleSlider.value))
        let translateX = CGAffineTransform(translationX: CGFloat(translateXSlider.value), y: 0)
        let translateY = CGAffineTransform(translationX: 0, y: CGFloat(translateYSlider.value))
        
        var transform = rotation.concatenating(scale)
        transform = transform.concatenating(translateX)
        transform = transform.concatenating(translateY)
        
        imageView.transform = transform
    }
    
    @IBAction func toggleMethod(sender: UISwitch) {
        addingTransform = sender.isOn
    }
    
    @IBAction func resetTransform(_ sender: AnyObject?) {
        rotationSlider.value = 0
        scaleSlider.value = 1
        translateXSlider.value = 0
        translateYSlider.value = 0
        
        addingTransform = false
        addingTransformSwitch.isOn = addingTransform
        
        // Point #1
        imageView.transform = CGAffineTransform.identity
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTransform(nil)
    }
}

