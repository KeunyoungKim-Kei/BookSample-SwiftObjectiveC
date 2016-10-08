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
    
    lazy var redView: UILabel = {
        let frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        let label = UILabel(frame: frame)
        label.backgroundColor = UIColor.redColor()
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.boldSystemFontOfSize(80)
        label.textAlignment = .Center
        label.text = "R"
        
        return label
    }()
    
    lazy var blueView: UILabel = {
        let frame = CGRect(x: 80, y: 80, width: 100, height: 100)
        let label = UILabel(frame: frame)
        label.backgroundColor = UIColor.blueColor()
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.boldSystemFontOfSize(80)
        label.textAlignment = .Center
        label.text = "B"
        
        return label
    }()
    
    var greenView: UILabel?
    
    func makeGreenView() -> UILabel {
        var frame = redView.frame
        frame.origin.x = 50
        frame.origin.y = 50
        
        let gView = UILabel(frame: frame)
        gView.backgroundColor = UIColor.greenColor()
        gView.textColor = UIColor.blackColor()
        gView.font = UIFont.boldSystemFontOfSize(80)
        gView.textAlignment = .Center
        gView.text = "G"
        
        return gView
    }
    
    @IBAction func addGreenView(sender: AnyObject) {
        if greenView == nil {
            greenView = makeGreenView()
        }
        
        if let gView = greenView {
            view.addSubview(gView)
        }
    }

    @IBAction func removeGreenView(sender: AnyObject) {
        if let gView = greenView {
            gView.removeFromSuperview()
            greenView = nil
        }
    }
    
    @IBAction func addGreenViewAboveRedView(sender: AnyObject) {
        if greenView == nil {
            greenView = makeGreenView()
        }
        
        if let gView = greenView {
            view.insertSubview(gView, aboveSubview: redView)
        }
    }
    
    @IBAction func addGreenViewBelowRedView(sender: AnyObject) {
        if greenView == nil {
            greenView = makeGreenView()
        }
        
        if let gView = greenView {
            view.insertSubview(gView, belowSubview: redView)
        }
    }
    
    @IBAction func bringGreenViewToFront(sender: AnyObject) {
        if let gView = greenView where gView.isDescendantOfView(view) {
            view.bringSubviewToFront(gView)
        }
    }
    
    @IBAction func sendGreenViewToBack(sender: AnyObject) {
        if let gView = greenView where gView.isDescendantOfView(view) {
            view.sendSubviewToBack(gView)
        }
    }
    
    @IBAction func exchangeRedViewWithGreenView(sender: AnyObject) {
        guard let gView = greenView, let gIndex = view.subviews.indexOf(gView) else {
            return
        }
        
        guard let rIndex = view.subviews.indexOf(redView) else {
            return
        }
        
        view.exchangeSubviewAtIndex(gIndex, withSubviewAtIndex: rIndex)
    }
    
    @IBAction func addGreenViewToBlueView(sender: AnyObject) {
        if let gView = greenView {
            blueView.addSubview(gView)
        }
    }
    
    @IBAction func toggleClipsToBounds(sender: AnyObject) {
        blueView.clipsToBounds = !blueView.clipsToBounds
    }
    
    @IBAction func addGreenViewToRootView(sender: AnyObject) {
        addGreenView(sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        view.addSubview(blueView)
    }
}





