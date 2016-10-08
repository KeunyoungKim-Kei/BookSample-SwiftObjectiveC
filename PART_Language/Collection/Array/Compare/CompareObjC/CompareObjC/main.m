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
            NSArray* alphabet = @[@"A", @"B", @"C", @"D", @"E"];
            NSArray* upper = @[@"A", @"B", @"C", @"D", @"E"];
            NSArray* shuffled = @[@"E", @"B", @"C", @"A", @"D"];
            NSArray* lower = @[@"a", @"b", @"c", @"d", @"e"];
            NSArray* mixed = @[@"A", @"b", @"C", @"d", @"e"];
            
            if ([alphabet isEqualToArray:upper]) {
                NSLog(@"alphabet == upper");
            } else {
                NSLog(@"alphabet != upper");
            }
            
            if ([alphabet isEqualToArray:shuffled]) {
                NSLog(@"alphabet == shuffled");
            } else {
                NSLog(@"alphabet != shuffled");
            }
            
            if ([alphabet isEqualToArray:lower]) {
                NSLog(@"alphabet == lower");
            } else {
                NSLog(@"alphabet != lower");
            }
            
            if ([alphabet isEqualToArray:mixed]) {
                NSLog(@"alphabet == mixed");
            } else {
                NSLog(@"alphabet != mixed");
            }
            
            // alphabet == upper
            // alphabet != shuffled
            // alphabet != lower
            // alphabet != mixed
        }
        
        // Block2
        {
            NSArray* alphabet = @[@"A", @"B", @"C", @"D", @"E"];
            NSArray* lower = @[@"a", @"b", @"c", @"d", @"e"];
            
            BOOL equal = YES;
            if ([alphabet count] == [lower count]) {
                for (int i = 0; i < [alphabet count]; i++) {
                    NSString* lhs = alphabet[i];
                    NSString* rhs = lower[i];
                    if ([lhs caseInsensitiveCompare:rhs] != NSOrderedSame) {
                        equal = NO;
                        break;
                    }
                }
            }
            
            if (equal) {
                NSLog(@"alphabet == lower");
            } else {
                NSLog(@"alphabet != lower");
            }
            // alphabet == lower
        }
    }
    return 0;
}
