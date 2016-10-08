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
            NSString* str1 = @"Objective-C";
            NSString* str2 = [str1 stringByAppendingString:@" Programming"];
            NSLog(@"%@", str2);
            // Objective-C Programming
        }
        
        // Block2
        {
            NSString* str1 = @"Objective-C";
            NSString* str2 = [str1 stringByAppendingFormat:@" %.1f %@", 2.0, @"Programming"];
            
            NSLog(@"%@", str2);
            // Objective-C 2.0 Programming
        }
        
        // Block3
        {
            NSMutableString* str = [NSMutableString stringWithString:@"Objective-C"];
            [str appendString:@" Programming"];
            
            NSLog(@"%@", str);
            // Objective-C Programming
            
            [str setString:@"Objective-C"];
            [str appendFormat:@" %.1f %@", 2.0, @"Programming"];
            
            NSLog(@"%@", str);
            // Objective-C 2.0 Programming
        }
    }
    return 0;
}
