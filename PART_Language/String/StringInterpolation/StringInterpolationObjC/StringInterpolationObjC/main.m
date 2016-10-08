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

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Block1
        {
            NSString* language = @"Objective-C";
            NSString* str = [NSString stringWithFormat:@"Let's learn %@", language];
            NSLog(@"%@", str);
            // Let's learn Objective-C
        }
        
        // Block2
        {
            int intValue = 123;
            NSString* str = [NSString stringWithFormat:@"value is %d", intValue];
            NSLog(@"%@", str);
            // value is 123
            
            NSInteger integerValue = 456;
            str = [NSString stringWithFormat:@"value is %ld", integerValue];
            NSLog(@"%@", str);
            // value is 456
            
            double doubleValue = 12.34;
            str = [NSString stringWithFormat:@"value is %f", doubleValue];
            NSLog(@"%@", str);
            // value is 12.340000
            
            str = [NSString stringWithFormat:@"value is %e", doubleValue];
            NSLog(@"%@", str);
            // value is 1.234000e+01
            
            CGFloat floatValue = 56.78;
            str = [NSString stringWithFormat:@"value is %.1f", floatValue];
            NSLog(@"%@", str);
            // value is 56.8
            
            const char* cString = @"C String".UTF8String;
            str = [NSString stringWithFormat:@"[%-20s]", cString];
            NSLog(@"%@", str);
            // [C String            ]
            
            str = [NSString stringWithFormat:@"[%20s]", cString];
            NSLog(@"%@", str);
            // [            C String]
        }
        
        // Block3
        {
            NSString* result = @"result";
            double doubleValue = 12.34;
            
            NSString* str = [NSString stringWithFormat:@"The %@ is %.2f.", result, doubleValue];
            NSLog(@"%@", str);
            // The result is 12.34.
            
            str = [NSString stringWithFormat:@"%2$.2f is the %1$@.", result, doubleValue];
            NSLog(@"%@", str);
            // 12.34 is the result.
        }
    }
    return 0;
}
