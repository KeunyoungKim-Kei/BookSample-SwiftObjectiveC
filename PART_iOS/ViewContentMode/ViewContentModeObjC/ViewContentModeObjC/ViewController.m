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
@property (weak, nonatomic) IBOutlet UILabel *currentModeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@end

@implementation ViewController

- (void)updateContentModeName {
    NSArray* modeNames = @[@"UIViewContentModeScaleToFill",
                           @"UIViewContentModeScaleAspectFit",
                           @"UIViewContentModeScaleAspectFill",
                           @"UIViewContentModeRedraw",
                           @"UIViewContentModeCenter",
                           @"UIViewContentModeTop",
                           @"UIViewContentModeBottom",
                           @"UIViewContentModeLeft",
                           @"UIViewContentModeRight",
                           @"UIViewContentModeTopLeft",
                           @"UIViewContentModeTopRight",
                           @"UIViewContentModeBottomLeft",
                           @"UIViewContentModeBottomRight"];
    
    self.currentModeLabel.text = modeNames[self.imageView.contentMode];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.layer.borderWidth = 2.0;
    self.imageView.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.toggleSwitch.on = self.imageView.clipsToBounds;
    
    [self updateContentModeName];
}


- (IBAction)toggleClipsToBounds:(UISwitch *)sender {
    self.imageView.clipsToBounds = sender.on;
}

- (IBAction)changeContentMode:(id)sender {
    UIViewContentMode currentMode = self.imageView.contentMode;
    if (currentMode == UIViewContentModeBottomRight) {
        self.imageView.contentMode = UIViewContentModeScaleToFill;
    } else {
        self.imageView.contentMode = ++currentMode;
    }
    
    [self updateContentModeName];
}

@end
