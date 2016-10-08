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
    var selectedTransitionType: UIViewAnimationOptions = []
    var secondaryView: UIView?
    
    @IBAction func chooseTransitionType(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Transition Type", message: "Choose One", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "None", style: .destructive, handler: { (action) in
            self.selectedTransitionType = UIViewAnimationOptions()
            self.transitionTypeButton.setTitle("Choose Transition Type", for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Left", style: .default, handler: { (action) in
            self.selectedTransitionType = .transitionFlipFromLeft
            self.transitionTypeButton.setTitle(action.title, for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Right", style: .default, handler: { (action) in
            self.selectedTransitionType = .transitionFlipFromRight
            self.transitionTypeButton.setTitle(action.title, for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Top", style: .default, handler: { (action) in
            self.selectedTransitionType = .transitionFlipFromTop
            self.transitionTypeButton.setTitle(action.title, for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Flip From Bottom", style: .default, handler: { (action) in
            self.selectedTransitionType = .transitionFlipFromBottom
            self.transitionTypeButton.setTitle(action.title, for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Curl Up", style: .default, handler: { (action) in
            self.selectedTransitionType = .transitionCurlUp
            self.transitionTypeButton.setTitle(action.title, for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Curl Down", style: .default, handler: { (action) in
            self.selectedTransitionType = .transitionCurlDown
            self.transitionTypeButton.setTitle(action.title, for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cross Dissolve", style: .default, handler: { (action) in
            self.selectedTransitionType = .transitionCrossDissolve
            self.transitionTypeButton.setTitle(action.title, for: UIControlState())
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func runSubviewTransition(_ sender: AnyObject) {
        UIView.transition(with: containerView, duration: 0.3, options: [selectedTransitionType], animations: {
            self.oneLabel.isHidden = !self.oneLabel.isHidden
            self.twoLabel.isHidden = !self.twoLabel.isHidden
            }, completion: nil)
    }
    
    @IBAction func switchView(_ sender: AnyObject) {
        if let secondaryView = secondaryView {
            UIView.transition(from: view, to: secondaryView, duration: 0.3, options: [selectedTransitionType], completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: { () -> Void in
                UIView.transition(from: secondaryView, to: self.view, duration: 0.3, options: [self.selectedTransitionType], completion: nil)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView(frame: view.bounds)
        v.backgroundColor = UIColor.blue
        secondaryView = v
    }
}

