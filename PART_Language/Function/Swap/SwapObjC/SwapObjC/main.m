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

void swap(NSInteger* lhs, NSInteger* rhs) {
    NSLog(@"before swap");
    NSLog(@"lhs: %ld", *lhs);
    NSLog(@"rhs: %ld", *rhs);
    
    NSInteger tmp = *lhs;
    *lhs = *rhs;
    *rhs = tmp;
    
    NSLog(@"after swap");
    NSLog(@"lhs: %ld", *lhs);
    NSLog(@"rhs: %ld", *rhs);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger a = 1;
        NSInteger b = 2;
        swap(&a, &b);
        
        NSLog(@"a: %ld", a);
        NSLog(@"b: %ld", b);
        
        // before swap
        // lhs: 1
        // rhs: 2
        // after swap
        // lhs: 2
        // rhs: 1
        // a: 2
        // b: 1
    }
    return 0;
}
