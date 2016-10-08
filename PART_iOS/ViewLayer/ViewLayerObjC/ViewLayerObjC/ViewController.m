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
@property (weak, nonatomic) IBOutlet UIView *targetView;
@property (weak, nonatomic) IBOutlet UISlider *borderWidthSlider;
@property (weak, nonatomic) IBOutlet UISlider *cornerRadiusSlider;
@property (weak, nonatomic) IBOutlet UISwitch *shadowToggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider *shadowOffsetSlider;
@property (weak, nonatomic) IBOutlet UISlider *shadowRadiusSlider;
@end

@implementation ViewController

- (IBAction)changeBorderWidth:(UISlider *)sender {
    self.targetView.layer.borderWidth = sender.value;
}

- (IBAction)changeCornerRadius:(UISlider *)sender {
    self.targetView.layer.cornerRadius = sender.value;
}

- (IBAction)toggleShadow:(UISwitch *)sender {
    self.targetView.layer.shadowColor = sender.isOn ? [UIColor blueColor].CGColor : nil;
    self.targetView.layer.shadowOpacity = sender.isOn ? 0.5 : 0.0;
    self.targetView.layer.shadowOffset = sender.isOn ? CGSizeMake(self.shadowOffsetSlider.value, self.shadowOffsetSlider.value) : CGSizeZero;
    self.targetView.layer.shadowRadius = sender.isOn ? self.shadowRadiusSlider.value : 0;
}

- (IBAction)changeShadowOffset:(UISlider *)sender {
    self.targetView.layer.shadowOffset = CGSizeMake(sender.value, sender.value);
}

- (IBAction)changeShadowRadius:(UISlider *)sender {
    self.targetView.layer.shadowRadius = sender.value;
}

- (IBAction)reset:(id)sender {
    self.targetView.layer.borderWidth = 0;
    self.targetView.layer.cornerRadius = 0;
    
    self.shadowToggleSwitch.on = NO;
    [self toggleShadow:self.shadowToggleSwitch];
    
    self.borderWidthSlider.value = 0;
    self.cornerRadiusSlider.value = 0;
    self.shadowOffsetSlider.value = 0;
    self.shadowRadiusSlider.value = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reset:nil];
}

@end
