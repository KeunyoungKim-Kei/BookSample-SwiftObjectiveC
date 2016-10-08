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

    @IBOutlet weak var stringValueField: UITextField!
    @IBOutlet weak var numberValueField: UITextField!
    
    func openURL(urlString: String) {
        guard let str = urlString.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding) else {
            return
        }
        
        guard let url = NSURL(string: str) else {
            return
        }
        
        if UIApplication.sharedApplication().canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.sharedApplication().openURL(url, options: [:], completionHandler: { (success) in
                    // Success
                })
            } else {
                if UIApplication.sharedApplication().openURL(url) {
                    // Success
                }
            }
        } else {
            let alert = UIAlertController(title: "URL Schemes", message: "사용할 수 없는 URL Scheme 입니다.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "확인", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func sendValue(_ sender: AnyObject) {
        guard let strVal = stringValueField.text?.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding) else {
            return
        }
        
        guard let numVal = numberValueField.text?.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding) else {
            return
        }
        
        let schemeStr = "vv://default_host/default_path?str=\(strVal)&num=\(numVal)"
        openURL(schemeStr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

