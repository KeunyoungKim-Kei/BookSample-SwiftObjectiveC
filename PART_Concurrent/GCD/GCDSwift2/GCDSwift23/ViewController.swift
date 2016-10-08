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

typealias SimpleBlock = ()->()
typealias ResultComplectionBlock = (Int)->()

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    let task1: SimpleBlock = {
        print("start Task #1")
        
        for index in 0..<3 {
            print("run Task #1")
            NSThread.sleepForTimeInterval(0.3)
        }
        
        print("end Task #1")
    }
    
    let task2: SimpleBlock = {
        print("start Task #2")
        
        for index in 0..<3 {
            print("run Task #2")
            NSThread.sleepForTimeInterval(0.3)
        }
        
        print("end Task #2")
    }
    
    let task3: SimpleBlock = {
        print("start Task #3")
        
        for index in 0..<10 {
            print("run Task #3")
            NSThread.sleepForTimeInterval(0.3)
        }
        
        print("end Task #3")
    }
    
    
    
    @IBAction func submitTaskSynchronouslyToSerialQueue(_ sender: AnyObject) {
        let taskQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL)
        
        print("before submit Task #1")
        dispatch_sync(taskQueue, task1)
        print("after submit Task #1");
        
        print("before submit Task #2")
        dispatch_sync(taskQueue, task2)
        print("after submit Task #2");
    }
    
    @IBAction func submitTaskSynchronouslyToConcurrentQueue(_ sender: AnyObject) {
        let taskQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_CONCURRENT)
        
        print("before submit Task #1")
        dispatch_sync(taskQueue, task1)
        print("after submit Task #1");
        
        print("before submit Task #2")
        dispatch_sync(taskQueue, task2)
        print("after submit Task #2");
    }
    
    
    @IBAction func submitTaskAsynchronouslyToSerialQueue(_ sender: AnyObject) {
        let taskQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL)
        
        print("before submit Task #1")
        dispatch_async(taskQueue, task1)
        print("after submit Task #1");
        
        print("before submit Task #2")
        dispatch_async(taskQueue, task2)
        print("after submit Task #2");
    }
    
    @IBAction func submitTaskAsynchronouslyToConcurrentQueue(_ sender: AnyObject) {
        let taskQueue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT)
        
        print("before submit Task #1")
        dispatch_async(taskQueue, task1)
        print("after submit Task #1");
        
        print("before submit Task #2")
        dispatch_async(taskQueue, task2)
        print("after submit Task #2");
    }
    
    func runBackgroundTask(completion: ResultComplectionBlock) {
        let queue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
        dispatch_async(queue, { [weak self] in
            dispatch_async(dispatch_get_main_queue(), { 
                self?.resultLabel.text = "Start"
            })
            
            NSThread.sleepForTimeInterval(2)
            
            var sum = 0
            for index in 1...100 {
                sum += index
                
                dispatch_async(dispatch_get_main_queue(), {
                    self?.resultLabel.text = "Processing #\(index)..."
                })
                
                NSThread.sleepForTimeInterval(0.1)
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self?.resultLabel.text = "Done! Waiting for result"
            })
            
            completion(sum)
        })
    }
    
    
    @IBAction func runBackgroundTaskAndUpdateUI(_ sender: AnyObject) {
        runBackgroundTask { (result) in
            NSThread.sleepForTimeInterval(2)
            
            dispatch_async(dispatch_get_main_queue(), { [weak self] in
                self?.resultLabel.text = "\(result)"
            })
        }
    }
    
    
    @IBAction func runTaskGroupAndWait(_ sender: AnyObject) {
        let globalQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
        let taskGroup = dispatch_group_create()
        
        print("before submit Tasks")
        dispatch_group_async(taskGroup, globalQueue, task1)
        dispatch_group_async(taskGroup, globalQueue, task2)
        dispatch_group_async(taskGroup, globalQueue, task3)
        print("after submit Tasks")
        
        dispatch_group_wait(taskGroup, DISPATCH_TIME_FOREVER)
        print("done!")
        print("after wait")
    }
    
    @IBAction func runTaskGroupAndNotify(_ sender: AnyObject) {
        let globalQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
        let taskGroup = dispatch_group_create()
        
        print("before submit Tasks")
        dispatch_group_async(taskGroup, globalQueue, task1)
        dispatch_group_async(taskGroup, globalQueue, task2)
        dispatch_group_async(taskGroup, globalQueue, task3)
        print("after submit Tasks")
        
        dispatch_group_notify(taskGroup, globalQueue) { 
            print("done!")
        }
        
        print("after notify")
    }
    
    @IBAction func synchronizeWithSemaphore(_ sender: AnyObject) {
        let globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
        let sem = dispatch_semaphore_create(3)
        
        for index in 1...10 {
            dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER)
            print("start task #\(index)")
            
            dispatch_async(globalQueue, { 
                let randomInterval = 1.0//Double(arc4random_uniform(20) + 5) * 0.1
                NSThread.sleepForTimeInterval(randomInterval)
                
                print("done task #\(index)")
                dispatch_semaphore_signal(sem)
            })
        }
    }
    
    
    @IBAction func runConcurrentLoop(_ sender: AnyObject) {
        let globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
        dispatch_async(globalQueue) { 
            do {
                if let url = NSURL(string: "https://www.apple.com") {
                    let str = try NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                    
                    let list = str.componentsSeparatedByString("\n")
                    
                    var startTime = CFAbsoluteTimeGetCurrent()
                    
                    for str in list {
                        var trimmedString = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                        if trimmedString.characters.count > 5 {
                            trimmedString = trimmedString.substringToIndex(trimmedString.startIndex.advancedBy(4))
                        }
                        
                        NSThread.sleepForTimeInterval(0.001)
                    }
                    
                    var timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
                    print("for-in loop: \(timeElapsed)")
                    
                    startTime = CFAbsoluteTimeGetCurrent()
                    
                    dispatch_apply(list.count, globalQueue, { (index) in
                        let str = list[index]
                        var trimmedString = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                        if trimmedString.characters.count > 5 {
                            trimmedString = trimmedString.substringToIndex(trimmedString.startIndex.advancedBy(4))
                        }
                        
                        NSThread.sleepForTimeInterval(0.001)
                    })
                    
                    timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
                    print("concurrent loop: \(timeElapsed)")
                }
            } catch {
                return
            }
        }
    }
}

