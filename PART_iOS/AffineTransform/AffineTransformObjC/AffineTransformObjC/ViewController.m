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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *addingTransformSwitch;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
@property (weak, nonatomic) IBOutlet UISlider *rotationSlider;
@property (weak, nonatomic) IBOutlet UISlider *translateXSlider;
@property (weak, nonatomic) IBOutlet UISlider *translateYSlider;
@property BOOL addingTransform;
@end

@implementation ViewController

- (IBAction)rotate:(UISlider *)sender {
    CGAffineTransform rotation;
    if (self.addingTransform) {
        rotation = CGAffineTransformRotate(self.imageView.transform, DEGREES_TO_RADIANS(sender.value));
    } else {
        rotation = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(sender.value));
    }
    
    self.imageView.transform = rotation;
}

- (IBAction)scale:(UISlider *)sender {
    CGAffineTransform scale;
    
    if (self.addingTransform) {
        scale = CGAffineTransformScale(self.imageView.transform, sender.value, sender.value);
    } else {
        scale = CGAffineTransformMakeScale(sender.value, sender.value);
    }
    
    self.imageView.transform = scale;
}

- (IBAction)translateX:(UISlider *)sender {
    CGAffineTransform translateX;
    
    if (self.addingTransform) {
        translateX = CGAffineTransformTranslate(self.imageView.transform, sender.value, 0);
    } else {
        translateX = CGAffineTransformMakeTranslation(sender.value, 0);
    }
    
    self.imageView.transform = translateX;
}
- (IBAction)translateY:(UISlider *)sender {
    CGAffineTransform translateY;
    
    if (self.addingTransform) {
        translateY = CGAffineTransformTranslate(self.imageView.transform, 0, sender.value);
    } else {
        translateY = CGAffineTransformMakeTranslation(0, sender.value);
    }
    
    self.imageView.transform = translateY;
}

- (IBAction)toggleMethod:(UISwitch *)sender {
    self.addingTransform = sender.isOn;
}

- (IBAction)concatAllTransform:(id)sender {
    self.imageView.transform = CGAffineTransformIdentity;
    
    CGAffineTransform rotation = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(self.rotationSlider.value));
    CGAffineTransform scale = CGAffineTransformMakeScale(self.scaleSlider.value, self.scaleSlider.value);
    CGAffineTransform translateX = CGAffineTransformMakeTranslation(self.translateXSlider.value, 0);
    CGAffineTransform translateY = CGAffineTransformMakeTranslation(0, self.translateYSlider.value);
    
    CGAffineTransform transform = CGAffineTransformConcat(rotation, scale);
    transform = CGAffineTransformConcat(transform, translateX);
    transform = CGAffineTransformConcat(transform, translateY);
    
    self.imageView.transform = transform;
}

- (IBAction)resetTransform:(id)sender {
    self.rotationSlider.value = 0;
    self.scaleSlider.value = 1;
    self.translateXSlider.value = 0;
    self.translateYSlider.value = 0;
    
    self.addingTransform = NO;
    [self.addingTransformSwitch setOn:self.addingTransform];
    
    // Point #1
    self.imageView.transform = CGAffineTransformIdentity;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetTransform:nil];
}

@end
