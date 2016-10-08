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

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSRange rangeValue = NSMakeRange(0, 7);
        NSValue* rangeObject = [NSValue valueWithRange:rangeValue];
        
        NSRange unboxedRangeValue = [rangeObject rangeValue];
        NSLog(@"%@", NSStringFromRange(unboxedRangeValue));
        // {0, 7}
        
        // CGPoint
        CGPoint ptValue = CGPointMake(100.0, 200.0);
        NSValue* pointObject = [NSValue valueWithCGPoint:ptValue];
        ptValue = [pointObject CGPointValue];
        
        // CGVector
        CGVector vectorValue = CGVectorMake(100.0, 200.0);
        NSValue* vectorObject = [NSValue valueWithCGVector:vectorValue];
        vectorValue = [vectorObject CGVectorValue];
        
        // CGSize
        CGSize sizeValue = CGSizeMake(100.0, 200.0);
        NSValue* sizeObject = [NSValue valueWithCGSize:sizeValue];
        sizeValue = [sizeObject CGSizeValue];
        
        // CGRect
        CGRect rectValue = CGRectMake(0.0, 0.0, 100.0, 200.0);
        NSValue* rectObject = [NSValue valueWithCGRect:rectValue];
        rectValue = [rectObject CGRectValue];
        
        // CGAffineTransform
        CGAffineTransform atValue = CGAffineTransformIdentity;
        NSValue* atObject = [NSValue valueWithCGAffineTransform:atValue];
        atValue = [atObject CGAffineTransformValue];
        
        // UIEdgeInsets
        UIEdgeInsets insetsValue = UIEdgeInsetsMake(10, 10, 10, 10);
        NSValue* insetsObject = [NSValue valueWithUIEdgeInsets:insetsValue];
        insetsValue = [insetsObject UIEdgeInsetsValue];
    }
    
    return 0;
}
