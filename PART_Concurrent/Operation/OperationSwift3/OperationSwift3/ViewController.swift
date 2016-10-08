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
    
    var opQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.qualityOfService = QualityOfService.userInitiated
        return queue
    }()
    
    var dataList: [Int] = {
        let cnt = arc4random_uniform(100) + 50
        var list = [Int]()
        for index in 0..<cnt {
            list.append(Int(arc4random_uniform(1000) + 1))
        }
        return list
    }()
    
    
    @IBAction func performConcurrentMode(_ sender: AnyObject) {
        // Point 1
        if opQueue.operationCount > 0 {
            opQueue.cancelAllOperations()
        }
        
        // Point 2
        let sumOp = SumOperation(dataList: dataList)
        sumOp.queuePriority = Operation.QueuePriority.veryHigh
        sumOp.completionBlock = { [weak sumOp] in
            if let sumOp = sumOp {
                if sumOp.isCancelled {
                    print("Sum Operation is cancelled. \(sumOp.result)")
                } else {
                    print("Sum Operation is finished. \(sumOp.result)")
                }
            }
        }
        
        let avgOp = AvgOperation(dataList: dataList)
        avgOp.queuePriority = Operation.QueuePriority.veryLow
        avgOp.completionBlock = { [weak avgOp] in
            if let avgOp = avgOp {
                if avgOp.isCancelled {
                    print("Avg Operation is cancelled. \(avgOp.result)")
                } else {
                    print("Avg Operation is finished. \(avgOp.result)")
                }
            }
        }
        
        let strOp = StringOperation(urlString: "https://www.apple.com")
        strOp.queuePriority = Operation.QueuePriority.veryLow
        strOp.completionBlock = { [weak strOp] in
            if let strOp = strOp {
                if strOp.isCancelled {
                    print("String Operation is cancelled.")
                } else {
                    print("String Operation is finished.")
                }
            }
        }
        
        // Point 3
        opQueue.addOperations([sumOp, avgOp, strOp], waitUntilFinished: false)
        
        // Point 4
        opQueue.addOperation {
            var cnt = 0
            while cnt < 50 {
                print("run Block Operation #\(cnt)")
                cnt += 1
                
                Thread.sleep(forTimeInterval: 0.2)
            }
        }
    }
    
    @IBAction func performSerialMode(_ sender: AnyObject) {
        if opQueue.operationCount > 0 {
            opQueue.cancelAllOperations()
        }
        
        let sumOp = SumOperation(dataList: dataList)
        sumOp.queuePriority = Operation.QueuePriority.veryHigh
        sumOp.completionBlock = { [weak sumOp] in
            if let sumOp = sumOp {
                if sumOp.isCancelled {
                    print("Sum Operation is cancelled. \(sumOp.result)")
                } else {
                    print("Sum Operation is finished. \(sumOp.result)")
                }
            }
        }
        
        let avgOp = AvgOperation(dataList: dataList)
        avgOp.queuePriority = Operation.QueuePriority.veryLow
        avgOp.completionBlock = { [weak avgOp] in
            if let avgOp = avgOp {
                if avgOp.isCancelled {
                    print("Avg Operation is cancelled. \(avgOp.result)")
                } else {
                    print("Avg Operation is finished. \(avgOp.result)")
                }
            }
        }
        // Point 1
        avgOp.addDependency(sumOp)
        
        let strOp = StringOperation(urlString: "https://www.apple.com")
        strOp.queuePriority = Operation.QueuePriority.veryLow
        strOp.completionBlock = { [weak strOp] in
            if let strOp = strOp {
                if strOp.isCancelled {
                    print("String Operation is cancelled.")
                } else {
                    print("String Operation is finished.")
                }
            }
        }
        strOp.addDependency(avgOp)
        
        let blockOp = BlockOperation {
            var cnt = 0
            while cnt < 50 {
                print("run Block Operation #\(cnt)")
                cnt += 1
                
                Thread.sleep(forTimeInterval: 0.2)
            }
        }
        blockOp.completionBlock = { [weak blockOp] in
            if let blockOp = blockOp {
                if blockOp.isCancelled {
                    print("Block Operation is cancelled.")
                } else {
                    print("Block Operation is finished.")
                }
            }
        }
        blockOp.addDependency(strOp)
        
        opQueue.addOperations([sumOp, avgOp, strOp, blockOp], waitUntilFinished: false)
        
        let mainThreadOp = BlockOperation {
            if Thread.isMainThread {
                var cnt = 0
                while cnt < 10 {
                    print("run Main Thread Operation #\(cnt)")
                    cnt += 1
                    
                    Thread.sleep(forTimeInterval: 0.1)
                }
            }
        }
        mainThreadOp.addDependency(blockOp)
        
        // Point 2
        OperationQueue.main.addOperation(mainThreadOp)
        
        // Point 3
        let cancellableBlockOp = BlockOperation()
        cancellableBlockOp.addExecutionBlock { [weak cancellableBlockOp] in
            if let cancellableBlockOp = cancellableBlockOp {
                var cnt = 0
                while cnt < 10 && !cancellableBlockOp.isCancelled {
                    print("run Cancellable Main Thread Operation #\(cnt)")
                    cnt += 1
                    
                    Thread.sleep(forTimeInterval: 0.1)
                }
            }
        }
        cancellableBlockOp.addDependency(mainThreadOp)
        
        opQueue.addOperation(cancellableBlockOp)
    }
    
    @IBAction func cancelAllOperations(_ sender: AnyObject) {
        opQueue.cancelAllOperations()
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

