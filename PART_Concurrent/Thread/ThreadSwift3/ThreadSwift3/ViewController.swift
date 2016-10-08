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

    @IBOutlet weak var runningTaskCountLabel: UILabel!
    
    var runningTaskCount = 0
    var stop = false
    let lock = NSLock()
    
    func updateLabel() {
        runningTaskCountLabel.text = "\(runningTaskCount)"
    }
    
    func backgroundTask() {
        autoreleasepool {
            stop = false
            var cnt = 1
            
            print("start task in \(Thread.current)")
            
            while !stop && cnt <= 100 {
                print("run task #\(cnt) in \(Thread.current)")
                cnt += 1
                Thread.sleep(forTimeInterval: 0.1)
            }
            
            print("end task in \(Thread.current)")
            
            if lock.try() {
                runningTaskCount -= 1
                lock.unlock()
            }
            
            performSelector(onMainThread: #selector(updateLabel), with: self, waitUntilDone: false)
        }
    }

    @IBAction func startTask(_ sender: AnyObject) {
        if lock.try() {
            runningTaskCount += 1
            lock.unlock()
        }
        
        runningTaskCountLabel.text = "\(runningTaskCount)"
        
        Thread.detachNewThreadSelector(#selector(ViewController.backgroundTask), toTarget: self, with: nil)
    }

    @IBAction func stopTask(_ sender: AnyObject) {
        stop = true
        
        runningTaskCount = 0
        runningTaskCountLabel.text = "\(runningTaskCount)"
    }
}

