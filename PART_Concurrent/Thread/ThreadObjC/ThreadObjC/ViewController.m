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
@property (weak, nonatomic) IBOutlet UILabel *runningTaskCountLabel;
@property NSUInteger runningTaskCount;
@property BOOL stop;
@end

@implementation ViewController

- (void)updateLabel {
    self.runningTaskCountLabel.text = [NSString stringWithFormat:@"%ld", self.runningTaskCount];
}

- (void)backgroundTask {
    @autoreleasepool {
        self.stop = NO;
        int cnt = 1;
        
        NSLog(@"start task in %@...", [NSThread currentThread]);
        
        while (!self.stop && cnt <= 100) {
            NSLog(@"run task #%d in %@...", cnt, [NSThread currentThread]);
            cnt += 1;
            [NSThread sleepForTimeInterval:0.1];
        }
        
        NSLog(@"end task in %@...", [NSThread currentThread]);
        
        @synchronized (self) {
            self.runningTaskCount -= 1;
        }
        
        [self performSelectorOnMainThread:@selector(updateLabel) withObject:nil waitUntilDone:NO];
    }
}

- (IBAction)startTask:(id)sender {
    @synchronized (self) {
        self.runningTaskCount += 1;
    }
    
    self.runningTaskCountLabel.text = [NSString stringWithFormat:@"%ld", self.runningTaskCount];
    
    [NSThread detachNewThreadSelector:@selector(backgroundTask) toTarget:self withObject:nil];
}

- (IBAction)stopTask:(id)sender {
    self.stop = YES;
    
    self.runningTaskCount = 0;
    self.runningTaskCountLabel.text = [NSString stringWithFormat:@"%ld", self.runningTaskCount];
}

@end
