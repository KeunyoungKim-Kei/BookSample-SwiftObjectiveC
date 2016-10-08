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
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var task1: DispatchWorkItem = {
        let item = DispatchWorkItem(block: {
            print("start Task #1")
            
            for index in 0..<3 {
                print("run Task #1")
                Thread.sleep(forTimeInterval: 0.3)
            }
            
            print("end Task #1")
        })
        
        return item
    }()
    
    var task2: DispatchWorkItem = {
        let item = DispatchWorkItem(block: {
            print("start Task #2")
            
            for index in 0..<3 {
                print("run Task #2")
                Thread.sleep(forTimeInterval: 0.3)
            }
            
            print("end Task #2")
        })
        
        return item
    }()
    
    var task3: DispatchWorkItem = {
        let item = DispatchWorkItem(block: {
            print("start Task #3")
            
            for index in 0..<10 {
                print("run Task #3")
                Thread.sleep(forTimeInterval: 0.3)
            }
            
            print("end Task #3")
        })
        
        return item
    }()

    @IBAction func submitTaskSynchronouslyToSerialQueue(_ sender: AnyObject) {
        let taskQueue = DispatchQueue(label: "serial_queue")
        
        print("before submit Task #1")
        taskQueue.sync(execute: task1)
        print("after submit Task #1")
        
        print("before submit Task #2")
        taskQueue.sync(execute: task2)
        print("after submit Task #2")
    }
    
    @IBAction func submitTaskSynchronouslyToConcurrentQueue(_ sender: AnyObject) {
        let taskQueue = DispatchQueue(label: "concurrent_queue", attributes: .concurrent)
        
        print("before submit Task #1")
        taskQueue.sync(execute: task1)
        print("after submit Task #1")
        
        print("before submit Task #2")
        taskQueue.sync(execute: task2)
        print("after submit Task #2")
    }
    
    
    @IBAction func submitTaskAsynchronouslyToSerialQueue(_ sender: AnyObject) {
        let taskQueue = DispatchQueue(label: "serial_queue")
        
        print("before submit Task #1")
        taskQueue.async(execute: task1)
        print("after submit Task #1")
        
        print("before submit Task #2")
        taskQueue.async(execute: task2)
        print("after submit Task #2")
    }
    
    @IBAction func submitTaskAsynchronouslyToConcurrentQueue(_ sender: AnyObject) {
        let taskQueue = DispatchQueue(label: "concurrent_queue", attributes: .concurrent)
        
        print("before submit Task #1")
        taskQueue.async(execute: task1)
        print("after submit Task #1")
        
        print("before submit Task #2")
        taskQueue.async(execute: task2)
        print("after submit Task #2")
    }
    
    
    func runBackgroundTask(completion: @escaping (Int)->()) {
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
        queue.async { [weak self] in
            DispatchQueue.main.async {
                self?.resultLabel.text = "Start"
            }
            
            Thread.sleep(forTimeInterval: 2)
            
            var sum = 0
            for index in 1...100 {
                sum += index
                
                DispatchQueue.main.async {
                    self?.resultLabel.text = "Processing #\(index)..."
                }
                
                Thread.sleep(forTimeInterval: 0.1)
            }
            
            DispatchQueue.main.async {
                self?.resultLabel.text = "Done! Waiting for result"
            }
            
            completion(sum)
        }
    }
    
    @IBAction func runBackgroundTaskAndUpdateUI(_ sender: AnyObject) {
        runBackgroundTask { (result) in
            Thread.sleep(forTimeInterval: 2)
            
            DispatchQueue.main.async { [weak self] in
                self?.resultLabel.text = "\(result)"
            }
        }
    }
    
    @IBAction func runTaskGroupAndWait(_ sender: AnyObject) {
        let globalQueue = DispatchQueue.global(qos: .utility)
        let taskGroup = DispatchGroup()
        
        print("before submit Tasks")
        globalQueue.async(group: taskGroup, execute: task1)
        globalQueue.async(group: taskGroup, execute: task2)
        globalQueue.async(group: taskGroup, execute: task3)
        print("after submit Tasks")
        
        taskGroup.wait()
        print("done!")
        print("after wait")
    }
    
    
    @IBAction func runTaskGroupAndNotify(_ sender: AnyObject) {
        let globalQueue = DispatchQueue.global(qos: .utility)
        let taskGroup = DispatchGroup()
        
        print("before submit Tasks")
        globalQueue.async(group: taskGroup, execute: task1)
        globalQueue.async(group: taskGroup, execute: task2)
        globalQueue.async(group: taskGroup, execute: task3)
        print("after submit Tasks")
        
        taskGroup.notify(queue: globalQueue) { 
            print("done!")
        }
        
        print("after wait")
    }
    
    @IBAction func synchronizeWithSemaphore(_ sender: AnyObject) {
        let globalQueue = DispatchQueue.global(qos: .userInitiated)
        let sem = DispatchSemaphore(value: 3)
        
        for index in 1...10 {
            sem.wait()
            print("start task #\(index)")
            
            globalQueue.async {
                let randomInterval = 1.0//Double(arc4random_uniform(20) + 5) * 0.1
                
                Thread.sleep(forTimeInterval: randomInterval)
                
                print("done task #\(index)")
                sem.signal()
            }
        }
    }
    
    @IBAction func runConcurrentLoop(_ sender: AnyObject) {
        DispatchQueue.global().async {
            do {
                if let url = URL(string: "https://www.apple.com") {
                    let str = try NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
                    let list = str.components(separatedBy: "\n")
                    
                    var startTime = CFAbsoluteTimeGetCurrent()
                    
                    for str in list {
                        var trimmedString = str.trimmingCharacters(in: CharacterSet.whitespaces)
                        if trimmedString.characters.count > 5 {
                            trimmedString = trimmedString.substring(to: trimmedString.index(trimmedString.startIndex, offsetBy: 4))
                        }
                        //print("\(trimmedString) => \(trimmedString.uppercased())")
                        
                        Thread.sleep(forTimeInterval: 0.001)
                    }
                    
                    var timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
                    print("for-in loop: \(timeElapsed)")
                    
                    startTime = CFAbsoluteTimeGetCurrent()
                    
                    DispatchQueue.concurrentPerform(iterations: list.count, execute: { (index) in
                        let str = list[index]
                        var trimmedString = str.trimmingCharacters(in: CharacterSet.whitespaces)
                        if trimmedString.characters.count > 5 {
                            trimmedString = trimmedString.substring(to: trimmedString.index(trimmedString.startIndex, offsetBy: 4))
                        }
                        
                        //print("\(trimmedString) => \(trimmedString.uppercased())")
                        
                        Thread.sleep(forTimeInterval: 0.001)
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

