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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var transitionTypeButton: UIButton!
    var selectedTransitionType = UIViewAnimationOptions.TransitionNone
    var secondaryView: UIView?
    
    @IBAction func chooseTransitionType(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Transition Type", message: "Choose One", preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "None", style: .Destructive, handler: { (action) in
            self.selectedTransitionType = .TransitionNone
            self.transitionTypeButton.setTitle("Choose Transition Type", forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Left", style: .Default, handler: { (action) in
            self.selectedTransitionType = .TransitionFlipFromLeft
            self.transitionTypeButton.setTitle(action.title, forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Right", style: .Default, handler: { (action) in
            self.selectedTransitionType = .TransitionFlipFromRight
            self.transitionTypeButton.setTitle(action.title, forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Top", style: .Default, handler: { (action) in
            self.selectedTransitionType = .TransitionFlipFromTop
            self.transitionTypeButton.setTitle(action.title, forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Bottom", style: .Default, handler: { (action) in
            self.selectedTransitionType = .TransitionFlipFromBottom
            self.transitionTypeButton.setTitle(action.title, forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Curl Up", style: .Default, handler: { (action) in
            self.selectedTransitionType = .TransitionCurlUp
            self.transitionTypeButton.setTitle(action.title, forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Curl Down", style: .Default, handler: { (action) in
            self.selectedTransitionType = .TransitionCurlDown
            self.transitionTypeButton.setTitle(action.title, forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cross Dissolve", style: .Default, handler: { (action) in
            self.selectedTransitionType = .TransitionCrossDissolve
            self.transitionTypeButton.setTitle(action.title, forState: .Normal)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func runSubviewTransition(sender: AnyObject) {
        UIView.transitionWithView(containerView, duration: 0.3, options: [selectedTransitionType], animations: {
            self.oneLabel.hidden = !self.oneLabel.hidden
            self.twoLabel.hidden = !self.twoLabel.hidden
        }, completion: nil)
    }
    
    @IBAction func switchView(sender: AnyObject) {
        if let secondaryView = secondaryView {
            UIView.transitionFromView(view, toView: secondaryView, duration: 0.3, options: [selectedTransitionType], completion: nil)
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
                UIView.transitionFromView(secondaryView, toView: self.view, duration: 0.3, options: [self.selectedTransitionType], completion: nil)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView(frame: view.bounds)
        v.backgroundColor = UIColor.blueColor()
        secondaryView = v
    }
}

