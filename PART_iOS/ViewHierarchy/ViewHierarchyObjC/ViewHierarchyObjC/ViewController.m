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
@property (strong, nonatomic) UILabel *redView;
@property (strong, nonatomic) UILabel* greenView;
@property (strong, nonatomic) UILabel *blueView;
@end

@implementation ViewController

- (UILabel*)makeGreenView {
    CGRect frame = self.redView.frame;
    frame.origin.x = 50;
    frame.origin.y = 50;
    
    UILabel* gView = [[UILabel alloc] initWithFrame:frame];
    gView.backgroundColor = [UIColor greenColor];
    gView.textColor = [UIColor blackColor];
    gView.font = [UIFont boldSystemFontOfSize:80];
    gView.textAlignment = NSTextAlignmentCenter;
    gView.text = @"G";
    
    return gView;
}

- (IBAction)addGreenView:(id)sender {
    if (self.greenView == nil) {
        UILabel* gView = [self makeGreenView];
        self.greenView = gView;
    }
    
    [self.view addSubview:self.greenView];
}

- (IBAction)removeGreenView:(id)sender {
    if (self.greenView != nil) {
        [self.greenView removeFromSuperview];
        self.greenView = nil;
    }
}

- (IBAction)addGreenViewAboveRedView:(id)sender {
    if (self.greenView == nil) {
        UILabel* gView = [self makeGreenView];
        self.greenView = gView;
    }
    
    [self.view insertSubview:self.greenView aboveSubview:self.redView];
}

- (IBAction)addGreenViewBelowRedView:(id)sender {
    if (self.greenView == nil) {
        UILabel* gView = [self makeGreenView];
        self.greenView = gView;
    }
    
    [self.view insertSubview:self.greenView belowSubview:self.redView];
}

- (IBAction)bringGreenViewToFront:(id)sender {
    if ([self.greenView isDescendantOfView:self.view]) {
        [self.view bringSubviewToFront:self.greenView];
    }
}

- (IBAction)sendGreenViewToBack:(id)sender {
    if ([self.greenView isDescendantOfView:self.view]) {
        [self.view sendSubviewToBack:self.greenView];
    }
}

- (IBAction)exchangeRedViewWithGreenView:(id)sender {
    NSUInteger gIndex = NSNotFound;
    NSUInteger rIndex = NSNotFound;
    
    NSArray* list = self.view.subviews;
    for (UIView* sv in list) {
        if (sv == self.greenView) {
            gIndex = [list indexOfObject:sv];
        } else if (sv == self.redView) {
            rIndex = [list indexOfObject:sv];
        }
    }
    
    if (gIndex != NSNotFound && rIndex != NSNotFound) {
        [self.view exchangeSubviewAtIndex:gIndex withSubviewAtIndex:rIndex];
    }
}

- (IBAction)addGreenViewToBlueView:(id)sender {
    if (self.greenView != nil) {
        [self.blueView addSubview:self.greenView];
    }
}

- (IBAction)toggleClipsToBounds:(id)sender {
    self.blueView.clipsToBounds = !self.blueView.clipsToBounds;
}


- (IBAction)addGreenViewToRootView:(id)sender {
    [self addGreenView:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Point #1
    CGRect frame = CGRectMake(20, 20, 100, 100);
    UILabel* rView = [[UILabel alloc] initWithFrame:frame];
    rView.backgroundColor = [UIColor redColor];
    rView.textColor = [UIColor whiteColor];
    rView.font = [UIFont boldSystemFontOfSize:80];
    rView.textAlignment = NSTextAlignmentCenter;
    rView.text = @"R";
    
    // Point #2
    [self.view addSubview:rView];
    self.redView = rView;
    
    // Point #3
    frame = CGRectMake(80, 80, 100, 100);
    UILabel* bView = [[UILabel alloc] initWithFrame:frame];
    bView.backgroundColor = [UIColor blueColor];
    bView.textColor = [UIColor whiteColor];
    bView.font = [UIFont boldSystemFontOfSize:80];
    bView.textAlignment = NSTextAlignmentCenter;
    bView.text = @"B";
    
    [self.view addSubview:bView];
    self.blueView = bView;
}

@end
