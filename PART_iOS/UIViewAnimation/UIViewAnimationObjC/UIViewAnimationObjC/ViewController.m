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

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *targetView;
@property (weak, nonatomic) IBOutlet UISwitch *animationSwitch;
@end

@implementation ViewController

- (IBAction)toggleAnimation:(UISwitch *)sender {
    [UIView setAnimationsEnabled:sender.on];
}

- (IBAction)animatePositionAndSize:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.targetView.frame = CGRectMake(200, 200, 150, 150);
    }];
}

- (IBAction)animateTransform:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.targetView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(140));
    }];
}

- (IBAction)animateAlpha:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.targetView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.targetView.alpha = 1.0;
        }];
    }];
}

- (IBAction)animateBackgroundColor:(id)sender {
    UIColor* randomColor = [UIColor colorWithRed:(arc4random() % 10 * 0.1)
                                           green:(arc4random() % 10 * 0.1)
                                            blue:(arc4random() % 10 * 0.1)
                                           alpha:1.0];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.targetView.backgroundColor = randomColor;
    }];
}

- (IBAction)animateKeyFrame:(id)sender {
    [UIView animateKeyframesWithDuration:3.0 delay:0.0 options:0 animations:^{
       [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
           self.targetView.frame = CGRectMake(200, 200, 150, 150);
       }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.3 animations:^{
            self.targetView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(140));
        }];
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.4 animations:^{
            self.targetView.alpha = 0.0;
        }];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.targetView.alpha = 1.0;
        }];
    }];
}

- (IBAction)animateWithSpringEffect:(id)sender {
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.2 initialSpringVelocity:0.0 options:0 animations:^{
        self.targetView.frame = CGRectMake(200, 200, 150, 150);
    } completion:nil];
}

- (IBAction)animateIndefinitely:(id)sender {
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        self.targetView.frame = CGRectMake(100, 100, 150, 150);
        self.targetView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(140));
    } completion:nil];
}

- (IBAction)removeAnimation:(id)sender {
    [self.targetView.layer removeAllAnimations];
    [self reset:sender];
}

- (IBAction)reset:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.targetView.transform = CGAffineTransformIdentity;
        self.targetView.frame = CGRectMake(30, 30, 50, 50);
        self.targetView.alpha = 1.0;
        self.targetView.backgroundColor = [UIColor redColor];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationSwitch.on = [UIView areAnimationsEnabled];
    
    [UIView performWithoutAnimation:^{
        [self reset:nil];
    }];
}

@end
