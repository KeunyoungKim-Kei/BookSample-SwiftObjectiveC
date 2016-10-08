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
    
    var taskId: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    
    func simulateDownload() {
        for index in 0..<200 {
            print("download # \(index)")
            
            let currentState = UIApplication.shared.applicationState
            switch currentState {
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("background")
                print("Remainint Time: \(UIApplication.shared.backgroundTimeRemaining)")
            }
            
            Thread.sleep(forTimeInterval: 1)
        }
    }
    
    
    @IBAction func performTask(_ sender: AnyObject) {
        simulateDownload()
    }
    
    @IBAction func performBackgroundTask(_ sender: AnyObject) {
        let sharedApp = UIApplication.shared
        taskId = sharedApp.beginBackgroundTask(expirationHandler: { [weak self] in
            if let strongSelf = self {
                sharedApp.endBackgroundTask(strongSelf.taskId)
                strongSelf.taskId = UIBackgroundTaskInvalid
            }
        })
        
        DispatchQueue.global().async { [weak self] in
            if let strongSelf = self {
                strongSelf.simulateDownload()
                sharedApp.endBackgroundTask(strongSelf.taskId)
                strongSelf.taskId = UIBackgroundTaskInvalid
            }
        }
    }
    
    @IBAction func showMessage(_ sender: AnyObject) {
        print("Process Button Touch")
    }
}
