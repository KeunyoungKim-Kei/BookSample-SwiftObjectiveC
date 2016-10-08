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

@interface ViewController ()

@property UIBackgroundTaskIdentifier taskId;

@end

@implementation ViewController

- (void)simulateDownload {
    for (int i = 0; i < 200; i++) {
        NSLog(@"download # %i", i);
        
        if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateBackground) {
            NSLog(@"Remaining Time: %.1f", [[UIApplication sharedApplication] backgroundTimeRemaining]);
        }
        
        UIApplicationState currentState = [[UIApplication sharedApplication] applicationState];
        switch (currentState) {
            case UIApplicationStateActive:
                NSLog(@"active");
                break;
            case UIApplicationStateInactive:
                NSLog(@"inactive");
                break;
            case UIApplicationStateBackground:
                NSLog(@"background");
                break;
        }
        
        [NSThread sleepForTimeInterval:1];
    }
}

- (IBAction)performTask:(id)sender {
    [self simulateDownload];
}

- (IBAction)performBackgroundTask:(id)sender {
    UIApplication* sharedApp = [UIApplication sharedApplication];
    _taskId = [sharedApp beginBackgroundTaskWithExpirationHandler:^{
        [sharedApp endBackgroundTask:_taskId];
        _taskId = UIBackgroundTaskInvalid;
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self simulateDownload];
        
        [sharedApp endBackgroundTask:_taskId];
        _taskId = UIBackgroundTaskInvalid;
    });
}

- (IBAction)showMessage:(id)sender {
    NSLog(@"Process Button Touch");
}

@end
