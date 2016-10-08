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
            unichar heart = L'\u2665';
            NSLog(@"%C", heart);
            // ♥
        }
        
        // Block2
        {
            NSString* precomposedHan = @"\uD55C";
            NSLog(@"%@", precomposedHan);
            // 한
            
            NSString* decomposedHan = @"\u1112\u1161\u11AB";
            NSLog(@"%@", decomposedHan);
            // 한
        }
        
        // Block3
        {
            NSString* precomposedHan = @"\uD55C";
            NSString* decomposedHan = @"\u1112\u1161\u11AB";
            
            if ([precomposedHan isEqualToString:decomposedHan]) {
                NSLog(@"%@ == %@", precomposedHan, decomposedHan);
            } else {
                NSLog(@"%@ != %@", precomposedHan, decomposedHan);
            }
            // 한 != 한
        }
        
        // Block4
        {
            NSString* precomposedCafe = @"caf\u00E9";
            NSLog(@"%@ - %d", precomposedCafe, precomposedCafe.length);
            // café - 4
            
            NSString* decomposedCafe = [NSString stringWithFormat:@"cafe%@", @"\u0301"];
            NSLog(@"%@ - %d", decomposedCafe, decomposedCafe.length);
            // café - 5
            
            if ([precomposedCafe isEqualToString:decomposedCafe]) {
                NSLog(@"%@ == %@", precomposedCafe, decomposedCafe);
            } else {
                NSLog(@"%@ != %@", precomposedCafe, decomposedCafe);
            }
            // café != café
        }
    }
    return 0;
}
