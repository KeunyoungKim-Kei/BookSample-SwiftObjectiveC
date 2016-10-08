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
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        label.text = "R"
        
        return label
    }()
    
    lazy var blueView: UILabel = {
        let frame = CGRect(x: 80, y: 80, width: 100, height: 100)
        let label = UILabel(frame: frame)
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.textAlignment = .center
        label.text = "B"
        
        return label
    }()
    
    var greenView: UILabel?
    
    func makeGreenView() -> UILabel {
        var frame = redView.frame
        frame.origin.x = 50
        frame.origin.y = 50
        // ...
        
        let gView = UILabel(frame: frame)
        gView.backgroundColor = UIColor.green
        gView.textColor = UIColor.black
        gView.font = UIFont.boldSystemFont(ofSize: 80)
        gView.textAlignment = .center
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
        if let gView = greenView , gView.isDescendant(of: view) {
            view.bringSubview(toFront: gView)
        }
    }
    
    @IBAction func sendGreenViewToBack(sender: AnyObject) {
        if let gView = greenView , gView.isDescendant(of: view) {
            view.sendSubview(toBack: gView)
        }
    }
    
    @IBAction func exchangeRedViewWithGreenView(sender: AnyObject) {
        guard let gView = greenView, let gIndex = view.subviews.index(of: gView) else {
            return
        }
        
        guard let rIndex = view.subviews.index(of: redView) else {
            return
        }
        
        view.exchangeSubview(at: gIndex, withSubviewAt: rIndex)
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
        addGreenView(sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        view.addSubview(blueView)
    }
}


