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
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UIButton *transitionTypeButton;
@property UIViewAnimationOptions selectedTransitionType;
@property (strong, nonnull) UIView* secondaryView;
@end

@implementation ViewController

- (IBAction)chooseTransitionType:(id)sender {
    UIAlertController* actionSheet = [UIAlertController alertControllerWithTitle:@"Transition Type" message:@"Choose One" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"None" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionNone;
        [self.transitionTypeButton setTitle:@"Choose Transition Type" forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Flip From Left" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionFlipFromLeft;
        [self.transitionTypeButton setTitle:action.title forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Flip From Right" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionFlipFromRight;
        [self.transitionTypeButton setTitle:action.title forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Flip From Top" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionFlipFromTop;
        [self.transitionTypeButton setTitle:action.title forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Flip From Bottom" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionFlipFromBottom;
        [self.transitionTypeButton setTitle:action.title forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Curl Up" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionCurlUp;
        [self.transitionTypeButton setTitle:action.title forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Curl Down" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionCurlDown;
        [self.transitionTypeButton setTitle:action.title forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cross Dissolve" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _selectedTransitionType = UIViewAnimationOptionTransitionCrossDissolve;
        [self.transitionTypeButton setTitle:action.title forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}


- (IBAction)runSubviewTransition:(id)sender {
    [UIView transitionWithView:self.containerView duration:0.3 options:self.selectedTransitionType animations:^{
        self.oneLabel.hidden = !self.oneLabel.hidden;
        self.twoLabel.hidden = !self.twoLabel.hidden;
    } completion:nil];
}

- (IBAction)switchView:(id)sender {
    [UIView transitionFromView:self.view toView:self.secondaryView duration:0.3 options:self.selectedTransitionType completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionFromView:self.secondaryView toView:self.view duration:0.3 options:self.selectedTransitionType completion:nil];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedTransitionType = UIViewAnimationOptionTransitionNone;
    
    UIView* v = [[UIView alloc] initWithFrame:self.view.bounds];
    v.backgroundColor = [UIColor blueColor];
    self.secondaryView = v;
}

@end
