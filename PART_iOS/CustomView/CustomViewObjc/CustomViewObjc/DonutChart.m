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

#import "DonutChart.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@implementation DonutChart

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _value = 0.0;
        _chartColor = [UIColor yellowColor];
        _chartBackgroundColor = [UIColor redColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _value = 0.0;
        _chartColor = [UIColor yellowColor];
        _chartBackgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat radius = (rect.size.width / 2) - 80;
    
    CGContextAddArc(ctx, rect.size.width / 2.0, rect.size.height / 2.0, radius, 0, M_PI * 2, 0);
    [self.chartBackgroundColor set];
    CGContextSetLineWidth(ctx, 60);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    CGContextAddArc(ctx, rect.size.width / 2.0, rect.size.height / 2.0, radius, DEGREES_TO_RADIANS(-90), DEGREES_TO_RADIANS(360 * self.value) + DEGREES_TO_RADIANS(-90), 0);
    [self.chartColor set];
    CGContextSetLineWidth(ctx, 60);
    CGContextDrawPath(ctx, kCGPathStroke);
}

//- (void)prepareForInterfaceBuilder {
//    self.value = 0.6;
//}

@end
