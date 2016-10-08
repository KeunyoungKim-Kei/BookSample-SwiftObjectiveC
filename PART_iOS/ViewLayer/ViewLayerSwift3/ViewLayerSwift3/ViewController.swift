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

class ViewController: UIViewController {
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var borderWidthSlider: UISlider!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    @IBOutlet weak var shadowToggleSwitch: UISwitch!
    @IBOutlet weak var shadowOffsetSlider: UISlider!
    @IBOutlet weak var shadowRadiusSlider: UISlider!
    
    @IBAction func changeBorderWidth(sender: UISlider) {
        targetView.layer.borderWidth = CGFloat(sender.value)
    }
    
    @IBAction func changeCornerRadius(sender: UISlider) {
        targetView.layer.cornerRadius = CGFloat(sender.value)
    }
    
    @IBAction func toggleShadow(_ sender: UISwitch) {
        targetView.layer.shadowColor = sender.isOn ? UIColor.blue.cgColor : nil
        targetView.layer.shadowOpacity = sender.isOn ? 0.5 : 0.0
        targetView.layer.shadowOffset = sender.isOn ? CGSize(width: CGFloat(shadowOffsetSlider.value), height: CGFloat(shadowOffsetSlider.value)) : CGSize.zero
        targetView.layer.shadowRadius = sender.isOn ? CGFloat(shadowRadiusSlider.value) : 0
    }
    
    @IBAction func changeShadowOffset(sender: UISlider) {
        targetView.layer.shadowOffset = CGSize(width: CGFloat(sender.value), height: CGFloat(sender.value))
    }
    
    @IBAction func changeShadowRadius(sender: UISlider) {
        targetView.layer.shadowRadius = CGFloat(sender.value)
    }
    
    @IBAction func reset(_ sender: AnyObject?) {
        targetView.layer.borderWidth = 0
        targetView.layer.cornerRadius = 0
        
        shadowToggleSwitch.isOn = false
        toggleShadow(shadowToggleSwitch)
        
        borderWidthSlider.value = 0
        cornerRadiusSlider.value = 0
        shadowOffsetSlider.value = 0
        shadowRadiusSlider.value = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset(nil)
    }
}

