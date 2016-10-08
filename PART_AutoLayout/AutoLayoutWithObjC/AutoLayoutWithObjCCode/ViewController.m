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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel* centerLabel = [UILabel new];
    centerLabel.backgroundColor = [UIColor yellowColor];
    centerLabel.text = @"Hello Auto Layout";
    centerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSLayoutConstraint* centerXConstraint = [NSLayoutConstraint constraintWithItem:centerLabel
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0f
                                                                          constant:0.0f];
    
    NSLayoutConstraint* centerYConstraint = [NSLayoutConstraint constraintWithItem:self.view
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:centerLabel
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0f
                                                                          constant:0.0f];
    [self.view addSubview:centerLabel];
    
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraint:centerYConstraint];
    
    UIButton* updateButton = [UIButton new];
    updateButton.backgroundColor = [UIColor redColor];
    [updateButton setTitle:@"Update" forState:UIControlStateNormal];
    updateButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:updateButton];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(updateButton);
    
    centerXConstraint = [NSLayoutConstraint constraintWithItem:updateButton
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.view
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0f
                                                      constant:0.0f];
    
    NSArray* horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[updateButton(100)]"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:views];
    NSArray* vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[updateButton(50)]-10-|"
                                                                       options:0
                                                                       metrics:nil
                                                                         views:views];
    [updateButton addConstraints:horzConstraints];
    [self.view addConstraint:centerXConstraint];
    [self.view addConstraints:vertConstraints];
    
    for (NSLayoutConstraint* theConstraint in self.view.constraints) {
        // ...
    }
    
    UIView* lineView = [UIView new];
    lineView.backgroundColor = [UIColor redColor];
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:lineView];
    
    views = NSDictionaryOfVariableBindings(centerLabel, lineView);
    
    horzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"[lineView(==centerLabel)]"
                                                              options:0
                                                              metrics:nil
                                                                views:views];
    
    NSDictionary* metrics = @{@"margin":@5, @"lineViewHeight":@4};
    vertConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[centerLabel]-margin-[lineView(lineViewHeight)]"
                                                              options:NSLayoutFormatAlignAllCenterX
                                                              metrics:metrics
                                                                views:views];
    
    [self.view addConstraints:horzConstraints];
    [self.view addConstraints:vertConstraints];
}

@end
