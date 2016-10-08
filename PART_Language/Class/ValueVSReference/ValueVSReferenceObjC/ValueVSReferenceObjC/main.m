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
#import "MyPoint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Block1
        {
            CGPoint startPoint = CGPointMake(0.0, 0.0);
            CGPoint endPoint = startPoint;
            
            endPoint.x = 100;
            endPoint.y = 200;
            
            NSLog(@"start point: {%.1f, %.1f}", startPoint.x, startPoint.y);
            NSLog(@"end point: {%.1f, %.1f}", endPoint.x, endPoint.y);
            // start point: {0.0, 0.0}
            // end point: {100.0, 200.0}
        }
        
        // Block2
        {
            MyPoint* startPoint = [[MyPoint alloc] initWithX:0.0 y:0.0];
            MyPoint* endPoint = startPoint;
            
            endPoint.x = 100;
            endPoint.y = 200;
            
            NSLog(@"start point: {%.1f, %.1f}", startPoint.x, startPoint.y);
            NSLog(@"end point: {%.1f, %.1f}", endPoint.x, endPoint.y);
            // start point: {100.0, 200.0}
            // end point: {100.0, 200.0}
        }
    }
    return 0;
}
