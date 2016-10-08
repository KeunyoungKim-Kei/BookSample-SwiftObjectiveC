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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centerLabel = UILabel()
        centerLabel.backgroundColor = UIColor.yellowColor()
        centerLabel.text = "Hello Auto Layout"
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var centerXConstraint = NSLayoutConstraint(item: centerLabel,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: self.view,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: centerLabel,
            attribute: .CenterY,
            multiplier: 1.0,
            constant: 0.0)
        
        self.view.addSubview(centerLabel)
        
        self.view.addConstraint(centerXConstraint)
        self.view.addConstraint(centerYConstraint)
        
        let updateButton = UIButton()
        updateButton.backgroundColor = UIColor.redColor()
        updateButton.setTitle("Update", forState: UIControlState.Normal)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(updateButton)
        
        var views:[String: AnyObject] = ["updateButton": updateButton]
        
        centerXConstraint = NSLayoutConstraint(item: updateButton,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: .CenterX,
            multiplier: 1.0,
            constant: 0.0)
        
        var horzConstraints = NSLayoutConstraint.constraintsWithVisualFormat("[updateButton(100)]",
            options: [],
            metrics: nil,
            views: views)
        var vertConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[updateButton(50)]-10-|",
            options: [],
            metrics: nil,
            views: views)
        
        updateButton.addConstraints(horzConstraints)
        self.view.addConstraint(centerXConstraint)
        self.view.addConstraints(vertConstraints)
        
        for theConstraint in self.view.constraints {
            // ...
        }
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.redColor()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(lineView)
        
        views = ["centerLabel": centerLabel, "lineView": lineView]
        
        horzConstraints = NSLayoutConstraint.constraintsWithVisualFormat("[lineView(==centerLabel)]",
            options: [],
            metrics: nil,
            views: views)
        
        let metrics = ["margin":NSNumber(integer: 5), "lineViewHeight":NSNumber(integer: 4)]
        vertConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[centerLabel]-margin-[lineView(lineViewHeight)]",
            options: NSLayoutFormatOptions.AlignAllCenterX,
            metrics: metrics,
            views: views)
        
        self.view.addConstraints(horzConstraints)
        self.view.addConstraints(vertConstraints)
    }

}

