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
    @IBOutlet weak var currentModeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    func updateContentModeName() {
        let modeNames = ["UIViewContentMode.scaleToFill",
                         "UIViewContentMode.scaleAspectFit",
                         "UIViewContentMode.scaleAspectFill",
                         "UIViewContentMode.redraw",
                         "UIViewContentMode.center",
                         "UIViewContentMode.top",
                         "UIViewContentMode.bottom",
                         "UIViewContentMode.left",
                         "UIViewContentMode.right",
                         "UIViewContentMode.topLeft",
                         "UIViewContentMode.topRight",
                         "UIViewContentMode.bottomLeft",
                         "UIViewContentMode.bottomRight"]
        
        currentModeLabel.text = modeNames[imageView.contentMode.rawValue]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.black.cgColor
        
        toggleSwitch.isOn = imageView.clipsToBounds
        
        updateContentModeName()
    }
    
    @IBAction func toggleClipsToBounds(sender: UISwitch) {
        imageView.clipsToBounds = sender.isOn
    }
    
    @IBAction func changeContentMode(sender: AnyObject) {
        var currentMode = imageView.contentMode.rawValue
        if currentMode == UIViewContentMode.bottomRight.rawValue {
            currentMode = 0
        } else {
            currentMode += 1
        }
        
        if let mode = UIViewContentMode(rawValue: currentMode) {
            imageView.contentMode = mode
        }
        
        updateContentModeName()
    }
}

