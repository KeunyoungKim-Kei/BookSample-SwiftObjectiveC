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
            NSString* str = @"Objective-C Programming";
            NSString* result = [str stringByReplacingOccurrencesOfString:@"Objective-C" withString:@"Objective-C"];
            NSLog(@"%@", result);
            // Objective-C Programming
            
            if ([str isEqualToString:result]) {
                NSLog(@"Equal");
            } else {
                NSLog(@"Not equal");
            }
            // Equal
            
            result = [str stringByReplacingOccurrencesOfString:@"Objective-C" withString:@"Objective-C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [str length])];
            NSLog(@"%@", result);
            // Objective-C Programming
            
            str = @"Swift Programming";
            NSRange replaceRange = NSMakeRange(0, 5);
            result = [str stringByReplacingCharactersInRange:replaceRange withString:@"Objective-C"];
            NSLog(@"%@", result);
            // Objective-C Programming
        }
        
        // Block2
        {
            NSMutableString* str = [NSMutableString stringWithString:@"Objective-C Programming"];
            [str replaceOccurrencesOfString:@"Objective-C" withString:@"Objective-C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, str.length)];
            NSLog(@"%@", str);
            // Objective-C Programming
            
            str = [NSMutableString stringWithString:@"Swift Programming"];
            
            NSRange replaceRange = NSMakeRange(0, 5);
            [str replaceCharactersInRange:replaceRange withString:@"Objective-C"];
            NSLog(@"%@", str);
            // Objective-C Programming
        }
    }
    return 0;
}
