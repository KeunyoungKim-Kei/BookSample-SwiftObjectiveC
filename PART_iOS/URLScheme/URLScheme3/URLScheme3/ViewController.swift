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
    
    func openURL(_ urlString: String) {
        guard let str = urlString.replacingPercentEscapes(using: String.Encoding.utf8) else {
            return
        }
        
        guard let url = URL(string: str) else  {
            return
        }
        
        if (UIApplication.shared.canOpenURL(url)) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    if success {
                        // Success
                    }
                })
            } else {
                if UIApplication.shared.openURL(url) {
                    // Success
                }
            }
        } else {
            let alert = UIAlertController(title: "URL Schemes", message: "사용할 수 없는 URL Scheme 입니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func openWebsite(_ sender: AnyObject) {
        openURL("https://www.apple.com")
    }
    
    @IBAction func openEmail(_ sender: AnyObject) {
        openURL("mailto:userid@example.com")
    }
    
    @IBAction func openPhone(_ sender: AnyObject) {
        openURL("sms:010-0000-0000")
    }
    
    @IBAction func openMessage(_ sender: AnyObject) {
        openURL("sms:010-0000-0000")
    }
    
    @IBAction func openFaceTime(_ sender: AnyObject) {
        openURL("facetime://userid@example.com")
    }
    
    @IBAction func openFaceTimeAudio(_ sender: AnyObject) {
        openURL("facetime-audio://userid@example.com")
    }
    
    @IBAction func openMap(_ sender: AnyObject) {
        openURL("http://maps.apple.com/?q=LA+dodgers+stadium")
    }
    
    @IBAction func openAppStore(_ sender: AnyObject) {
        openURL("itms://itunes.apple.com/us/app/apple-store/id640199958?mt=8")
    }


}

