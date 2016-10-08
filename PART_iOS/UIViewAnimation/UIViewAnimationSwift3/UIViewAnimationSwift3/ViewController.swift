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

class ViewController: UIViewController {
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var animationSwitch: UISwitch!
    
    @IBAction func toggleAnimation(sender: UISwitch) {
        UIView.setAnimationsEnabled(sender.isOn)
    }
    
    @IBAction func animatePositionAndSize(sender: AnyObject) {
        UIView.animate(withDuration: 0.3) {
            self.targetView.frame = CGRect(x: 200, y: 200, width: 150, height: 150)
        }
    }
    
    @IBAction func animateTransform(sender: AnyObject) {
        UIView.animate(withDuration: 0.3) {
            self.targetView.transform = CGAffineTransform(rotationAngle: radian(140))
        }
    }
    
    @IBAction func animateAlpha(sender: AnyObject) {
        UIView.animate(withDuration: 0.3, animations: {
            self.targetView.alpha = 0.0
            }, completion: { (finished) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.targetView.alpha = 1.0
                })
        })
    }
    
    @IBAction func animateBackgroundColor(sender: AnyObject) {
        let randomColor = UIColor(red: CGFloat(arc4random() % 10) * 0.1,
                                  green: CGFloat(arc4random() % 10) * 0.1,
                                  blue: CGFloat(arc4random() % 10) * 0.1,
                                  alpha: 1.0)
        
        UIView.animate(withDuration: 0.3) {
            self.targetView.backgroundColor = randomColor
        }
    }
    
    @IBAction func animateKeyFrame(sender: AnyObject) {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.targetView.frame = CGRect(x: 200, y: 200, width: 150, height: 150)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.targetView.transform = CGAffineTransform(rotationAngle: radian(140))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                self.targetView.alpha = 0.0
            })
        }, completion: { (finished) in
            UIView.animate(withDuration: 0.3, animations: {
                self.targetView.alpha = 1.0
            })
        })
    }
    
    @IBAction func animateWithSpringEffect(sender: AnyObject) {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: [], animations: {
            self.targetView.frame = CGRect(x: 200, y: 200, width: 150, height: 150)
        }, completion: nil)
    }
    
    @IBAction func animateIndefinitely(sender: AnyObject) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn, .autoreverse, .repeat], animations: {
            self.targetView.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
            self.targetView.transform = CGAffineTransform(rotationAngle: radian(140))
        }, completion: nil)
    }
    
    @IBAction func removeAnimation(sender: AnyObject) {
        targetView.layer.removeAllAnimations()
        reset(nil)
    }
    
    @IBAction func reset(_ sender: AnyObject?) {
        UIView.animate(withDuration: 0.3) {
            self.targetView.transform = CGAffineTransform.identity
            self.targetView.frame = CGRect(x: 30, y: 30, width: 50, height: 50)
            self.targetView.alpha = 1.0
            self.targetView.backgroundColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationSwitch.isOn = UIView.areAnimationsEnabled
        
        UIView.performWithoutAnimation {
            self.reset(nil)
        }
    }
}


