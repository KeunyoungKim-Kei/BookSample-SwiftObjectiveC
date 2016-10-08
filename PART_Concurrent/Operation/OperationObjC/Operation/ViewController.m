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

#import "ViewController.h"
#import "SumOperation.h"
#import "AvgOperation.h"
#import "StringOperation.h"

@interface ViewController ()
@property (strong, nonatomic) NSOperationQueue* opQueue;
@property (strong, nonatomic) NSMutableArray* dataList;
@end

@implementation ViewController

- (IBAction)performConcurrentMode:(id)sender {
    // Point 1
    if (self.opQueue.operationCount > 0) {
        [self.opQueue cancelAllOperations];
    }
    
    // Point 2
    SumOperation* sumOp = [[SumOperation alloc] initWithData:self.dataList];
    sumOp.queuePriority = NSOperationQueuePriorityVeryHigh;
    __weak SumOperation* weakSumOp = sumOp;
    [sumOp setCompletionBlock:^{
        if (weakSumOp.isCancelled) {
            NSLog(@"Sum Operation is cancelled. %ld", weakSumOp.result);
        } else {
            NSLog(@"Sum Operation is finished. %ld", weakSumOp.result);
        }
    }];
    
    AvgOperation* avgOp = [[AvgOperation alloc] initWithData:self.dataList];
    avgOp.queuePriority = NSOperationQueuePriorityVeryLow;
    __weak AvgOperation* weakAvgOp = avgOp;
    [avgOp setCompletionBlock:^{
        if (weakAvgOp.isCancelled) {
            NSLog(@"Avg Operation is cancelled. %f", weakAvgOp.result);
        } else {
            NSLog(@"Avg Operation is finished. %f", weakAvgOp.result);
        }
    }];
    
    StringOperation* strOp = [[StringOperation alloc] initWithUrlString:@"https://www.apple.com"];
    avgOp.queuePriority = NSOperationQueuePriorityVeryLow;
    __weak StringOperation* weakStrOp = strOp;
    [strOp setCompletionBlock:^{
        if (weakStrOp.isCancelled) {
            NSLog(@"String Operation is cancelled.");
        } else {
            NSLog(@"String Operation is finished.");
        }
    }];
    
    // Point 3
    [self.opQueue addOperations:@[sumOp, avgOp, strOp] waitUntilFinished:NO];
    
    // Point 4
    [self.opQueue addOperationWithBlock:^{
        int cnt = 0;
        while (cnt < 50) {
            NSLog(@"run Block Operation #%d", cnt);
            cnt += 1;
            
            [NSThread sleepForTimeInterval:0.2];
        }
    }];
}

- (IBAction)performSerialMode:(id)sender {
    if (self.opQueue.operationCount > 0) {
        [self.opQueue cancelAllOperations];
    }
    
    SumOperation* sumOp = [[SumOperation alloc] initWithData:self.dataList];
    sumOp.queuePriority = NSOperationQueuePriorityVeryHigh;
    __weak SumOperation* weakSumOp = sumOp;
    [sumOp setCompletionBlock:^{
        if (weakSumOp.isCancelled) {
            NSLog(@"Sum Operation is cancelled. %ld", weakSumOp.result);
        } else {
            NSLog(@"Sum Operation is finished. %ld", weakSumOp.result);
        }
    }];
    
    AvgOperation* avgOp = [[AvgOperation alloc] initWithData:self.dataList];
    avgOp.queuePriority = NSOperationQueuePriorityVeryLow;
    __weak AvgOperation* weakAvgOp = avgOp;
    [avgOp setCompletionBlock:^{
        if (weakAvgOp.isCancelled) {
            NSLog(@"Avg Operation is cancelled. %f", weakAvgOp.result);
        } else {
            NSLog(@"Avg Operation is finished. %f", weakAvgOp.result);
        }
    }];
    // Point 1
    [avgOp addDependency:sumOp];
    
    StringOperation* strOp = [[StringOperation alloc] initWithUrlString:@"https://www.apple.com"];
    avgOp.queuePriority = NSOperationQueuePriorityVeryLow;
    __weak StringOperation* weakStrOp = strOp;
    [strOp setCompletionBlock:^{
        if (weakStrOp.isCancelled) {
            NSLog(@"String Operation is cancelled.");
        } else {
            NSLog(@"String Operation is finished.");
        }
    }];
    [strOp addDependency:avgOp];
    
    NSBlockOperation* blockOp = [NSBlockOperation blockOperationWithBlock:^{
        int cnt = 0;
        while (cnt < 50) {
            NSLog(@"run Block Operation #%d", cnt);
            cnt += 1;
            
            [NSThread sleepForTimeInterval:0.2];
        }
    }];
    __weak NSBlockOperation* weakBlockOp = blockOp;
    [blockOp setCompletionBlock:^{
        if (weakBlockOp.isCancelled) {
            NSLog(@"Block Operation is cancelled.");
        } else {
            NSLog(@"Block Operation is finished.");
        }
    }];
    [blockOp addDependency:strOp];
    
    [self.opQueue addOperations:@[sumOp, avgOp, strOp, blockOp] waitUntilFinished:NO];
    
    NSBlockOperation* mainThreadOp = [NSBlockOperation blockOperationWithBlock:^{
        if ([NSThread isMainThread]) {
            int cnt = 0;
            while (cnt < 10) {
                NSLog(@"run Main Thread Operation #%d", cnt);
                cnt += 1;
                
                [NSThread sleepForTimeInterval:0.1];
            }
        }
    }];
    // Point 2
    [mainThreadOp addDependency:blockOp];
    
    // Point 3
    [[NSOperationQueue mainQueue] addOperation:mainThreadOp];
    
    // Point 4
    NSBlockOperation* cancellableBlockOp = [[NSBlockOperation alloc] init];
    [cancellableBlockOp addExecutionBlock:^{
        if ([NSThread isMainThread]) {
            int cnt = 0;
            while (cnt < 10 && !cancellableBlockOp.isCancelled) {
                NSLog(@"run Cancellable Main Thread Operation #%d", cnt);
                cnt += 1;
                
                [NSThread sleepForTimeInterval:0.1];
            }
        }
    }];
    [cancellableBlockOp addDependency:mainThreadOp];
    
    [[NSOperationQueue mainQueue] addOperation:cancellableBlockOp];
}


- (IBAction)cancelAllOperations:(id)sender {
    [self.opQueue cancelAllOperations];
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.opQueue = [[NSOperationQueue alloc] init];
    self.opQueue.qualityOfService = NSQualityOfServiceUserInitiated;
    
    int cnt = arc4random_uniform(100) + 50;
    self.dataList = [[NSMutableArray alloc] initWithCapacity:cnt];
    for (int i = 0; i < cnt; i++) {
        [self.dataList addObject:@(arc4random_uniform(1000) + 1)];
    }
}


@end
