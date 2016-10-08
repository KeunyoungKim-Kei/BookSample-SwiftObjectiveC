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

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

typedef void (^SimpleBlock)(void);
typedef void (^ResultCompletionBlock)(int result);

@interface ViewController ()
@property (copy, nonatomic) SimpleBlock task1;
@property (copy, nonatomic) SimpleBlock task2;
@property (copy, nonatomic) SimpleBlock task3;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation ViewController

- (IBAction)submitTaskSynchronouslyToSerialQueue:(id)sender {
    dispatch_queue_t taskQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"before submit Task #1");
    dispatch_sync(taskQueue, self.task1);
    NSLog(@"after submit Task #1");
    
    NSLog(@"before submit Task #2");
    dispatch_sync(taskQueue, self.task2);
    NSLog(@"after submit Task #2");
}

- (IBAction)submitTaskSynchronouslyToConcurrentQueue:(id)sender {
    dispatch_queue_t taskQueue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"=========================================");
    
    NSLog(@"before submit Task #1");
    dispatch_sync(taskQueue, self.task1);
    NSLog(@"after submit Task #1");
    
    NSLog(@"before submit Task #2");
    dispatch_sync(taskQueue, self.task2);
    NSLog(@"after submit Task #2");
}


- (IBAction)submitTaskAsynchronouslyToSerialQueue:(id)sender {
    dispatch_queue_t taskQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"=========================================");
    
    NSLog(@"before submit Task #1");
    dispatch_async(taskQueue, self.task1);
    NSLog(@"after submit Task #1");
    
    NSLog(@"before submit Task #2");
    dispatch_async(taskQueue, self.task2);
    NSLog(@"after submit Task #2");
}

- (IBAction)submitTaskAynchronouslyToConcurrentQueue:(id)sender {
    dispatch_queue_t taskQueue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"=========================================");
    
    NSLog(@"before submit Task #1");
    dispatch_async(taskQueue, self.task1);
    NSLog(@"after submit Task #1");
    
    NSLog(@"before submit Task #2");
    dispatch_async(taskQueue, self.task2);
    NSLog(@"after submit Task #2");
}


- (void)runBackgroundTaskWithCompletion:(ResultCompletionBlock)completion {
    __weak ViewController* weakSelf = self;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.resultLabel.text = @"Start";
        });
        
        [NSThread sleepForTimeInterval:2];
        
        int sum = 0;
        for (int i = 1; i <= 100; i++) {
            sum += i;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.resultLabel.text = [NSString stringWithFormat:@"Processing #%d...", i];
            });
            
            [NSThread sleepForTimeInterval:0.1];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.resultLabel.text = @"Done! Waiting for result";
        });
        
        if (completion) {
            completion(sum);
        }
    });
}


- (IBAction)runBackgroundTaskAndUpdateUI:(id)sender {
    __weak ViewController* weakSelf = self;
    
    [self runBackgroundTaskWithCompletion:^(int result) {
        [NSThread sleepForTimeInterval:2];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.resultLabel.text = @(result).stringValue;
        });
    }];
}

- (IBAction)runTaskGroupAndWait:(id)sender {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_group_t taskGroup = dispatch_group_create();
    
    NSLog(@"before submit Tasks");
    dispatch_group_async(taskGroup, globalQueue, self.task1);
    dispatch_group_async(taskGroup, globalQueue, self.task2);
    dispatch_group_async(taskGroup, globalQueue, self.task3);
    NSLog(@"after submit Tasks");
    
    dispatch_group_wait(taskGroup, DISPATCH_TIME_FOREVER);
    NSLog(@"done!");
    NSLog(@"after wait");
}


- (IBAction)runTaskGroupAndNotify:(id)sender {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_group_t taskGroup = dispatch_group_create();
    
    NSLog(@"before submit Tasks");
    dispatch_group_async(taskGroup, globalQueue, self.task1);
    dispatch_group_async(taskGroup, globalQueue, self.task2);
    dispatch_group_async(taskGroup, globalQueue, self.task3);
    NSLog(@"after submit Tasks");
    
    dispatch_group_notify(taskGroup, globalQueue, ^{
        NSLog(@"done!");
    });
    NSLog(@"after wait");
}

- (IBAction)runSemaphore:(id)sender {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
//    dispatch_async(globalQueue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(3);
        
        for (int i = 1; i <= 10; i++) {
            dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
            NSLog(@"start task #%d", i);
            
            dispatch_async(globalQueue, ^{
                NSTimeInterval randomInterval = 1;//(arc4random_uniform(20) + 5) * 0.1;
                [NSThread sleepForTimeInterval:randomInterval];
                
                NSLog(@"done task #%d", i);
                dispatch_semaphore_signal(sem);
            });
        }
        
//    });
}

- (IBAction)runConcurrentLoop:(id)sender {
    dispatch_queue_t globalQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    dispatch_async(globalQueue, ^{
        NSURL* url = [NSURL URLWithString:@"https://www.apple.com"];
        NSError* error = nil;
        NSString* str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        if (!error) {
            NSArray* list = [str componentsSeparatedByString:@"\n"];
            
            CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
            
            for (NSString* str in list) {
                NSString* trimmedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                if ([trimmedString length] > 5) {
                    trimmedString = [trimmedString substringToIndex:4];
                }
                
                [NSThread sleepForTimeInterval:0.001];
            }
            
            CFAbsoluteTime timeElapsed = CFAbsoluteTimeGetCurrent() - startTime;
            NSLog(@"for-in loop: %f", timeElapsed);
            
            startTime = CFAbsoluteTimeGetCurrent();
            
            dispatch_apply([list count], globalQueue, ^(size_t index) {
                NSString* str = list[index];
                NSString* trimmedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                if ([trimmedString length] > 5) {
                    trimmedString = [trimmedString substringToIndex:4];
                }
                
                [NSThread sleepForTimeInterval:0.001];
            });
            
            timeElapsed = CFAbsoluteTimeGetCurrent() - startTime;
            NSLog(@"concurrent loop: %f", timeElapsed);
        }
    });
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.task1 = ^{
        NSLog(@"start Task #1");
        
        for (int i = 0; i < 3; i++) {
            NSLog(@"run Task #1");
            [NSThread sleepForTimeInterval:0.3];
        }
        
        NSLog(@"end Task #1");
    };
    
    self.task2 = ^{
        NSLog(@"start Task #2");
        
        for (int i = 0; i < 3; i++) {
            NSLog(@"run Task #2");
            [NSThread sleepForTimeInterval:0.3];
        }
        
        NSLog(@"end Task #2");
    };
    
    self.task3 = ^{
        NSLog(@"start Task #3");
        
        for (int i = 0; i < 10; i++) {
            NSLog(@"run Task #3");
            [NSThread sleepForTimeInterval:0.3];
        }
        
        NSLog(@"end of Task #3");
    };
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
