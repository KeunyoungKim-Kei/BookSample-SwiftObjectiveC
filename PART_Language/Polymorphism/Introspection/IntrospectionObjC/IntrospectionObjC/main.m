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
#import "Square.h"
#import "Circle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Rectangle* r = [[Rectangle alloc] init];
        
        // Block1
        {
            if ([r isMemberOfClass:[Rectangle class]]) {
                NSLog(@"r is a member of Rectangle class");
            } else {
                NSLog(@"r is not a member of Rectangle class");
            }
            // r is a member of Rectangle class
            
            if ([r isMemberOfClass:[Shape class]]) {
                NSLog(@"r is a member of Shape class");
            } else {
                NSLog(@"r is not a member of Shape class");
            }
            // r is not a member of Shape class
        }
        
        // Block2
        {
            if ([r isKindOfClass:[Rectangle class]]) {
                NSLog(@"r is a kind of Rectangle class");
            } else {
                NSLog(@"r is not a kind of Rectangle class");
            }
            // r is a kind of Rectangle class
            
            if ([r isKindOfClass:[Shape class]]) {
                NSLog(@"r is a kind of Shape class");
            } else {
                NSLog(@"r is not a kind of Shape class");
            }
            // r is a kind of Shape class
        }
        
        // Block3
        {
            if ([Circle isSubclassOfClass:[Shape class]]) {
                NSLog(@"Circle is a subclass of Shape");
            } else {
                NSLog(@"Circle is not a subclass of Shape");
            }
            // Circle is a subclass of Shape
        }
        
        // Block4
        {
            if ([Shape conformsToProtocol:@protocol(NSObject)]) {
                NSLog(@"Shape conforms to the NSObject protocol");
            } else {
                NSLog(@"Shape doesn't conforms to the NSObject protocol");
            }
            // Shape conforms to the NSObject protocol
        }
        
        // Block5
        {
            if ([Shape instancesRespondToSelector:@selector(draw)]) {
                NSLog(@"Shape can respond to draw");
            } else {
                NSLog(@"Shape cannot respond to draw");
            }
            // Shape can respond to draw
            
            if ([r respondsToSelector:@selector(length)]) {
                NSLog(@"r can respond to length");
            } else {
                NSLog(@"r cannot respond to length");
            }
            // r cannot respond to length    
        }
        
    }
    return 0;
}
