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
            NSString* str = @"Objective-C";
            NSComparisonResult result = [str compare:@"objective-c" options:NSCaseInsensitiveSearch];
            if (result == NSOrderedSame) {
                // ...
            }
        }
        
        // Block2
        {
            NSString* precomposed = @"\uD55C\uAE00";
            NSString* decomposed = @"\u1112\u1161\u11AB\u1100\u1173\u11AF";
            
            if ([decomposed compare:precomposed] == NSOrderedSame) {
                NSLog(@"equal");
            } else {
                NSLog(@"not equal");
            }
            // equal
        }
        
        // Block3
        {
            NSString* precomposed = @"\uD55C\uAE00";
            NSString* decomposed = @"\u1112\u1161\u11AB\u1100\u1173\u11AF";
            
            if ([decomposed compare:precomposed options:NSLiteralSearch] == NSOrderedSame) {
                NSLog(@"equal");
            } else {
                NSLog(@"not equal");
            }
            // not equal
        }
        
        // Block4
        {
            NSString* str = @"Objective-C Programming";
            NSRange result = [str rangeOfString:@"i"];
            NSLog(@"%ld", result.location);
            // 6
            
            result = [str rangeOfString:@"i" options:NSBackwardsSearch];
            NSLog(@"%ld", result.location);
            // 20
        }
        
        // Block5
        {
            NSString* str = @"Objective-C Programming";
            NSRange result = [str rangeOfString:@"Obj" options:NSAnchoredSearch];
            NSLog(@"%ld", result.location);
            // 0
            
            result = [str rangeOfString:@"Obj" options:NSAnchoredSearch|NSBackwardsSearch];
            NSLog(@"%ld", result.location);
            // NSNotFound
        }
        
        // Block6
        {
            NSString* file9 = @"file9.txt";
            NSString* file10 = @"file10.txt";
            NSComparisonResult result = [file9 compare:file10];
            NSLog(@"%ld", result);
            // 1 (NSOrderedDescending)
            
            result = [file9 compare:file10 options:NSNumericSearch];
            NSLog(@"%ld", result);
            // -1 (NSOrderedAscending)
        }
        
        // Block7
        {
            NSString* withoutDiacritic = @"A";
            NSString* withDiacritic = @"Ä";
            
            NSComparisonResult result = [withoutDiacritic compare:withDiacritic];
            NSLog(@"%ld", result);
            // -1 (NSOrderedAscending)
            
            result = [withoutDiacritic compare:withDiacritic options:NSDiacriticInsensitiveSearch];
            NSLog(@"%ld", result);
            // 0 (NSOrderedSame)
        }
        
        // Block8
        {
            NSString* fullWidth = @"\u30A1";
            NSString* halfWidth = @"\uFF67";
            
            NSComparisonResult result = [fullWidth compare:halfWidth];
            NSLog(@"%ld", result);
            // -1 (NSOrderedAscending)
            
            result = [fullWidth compare:halfWidth options:NSWidthInsensitiveSearch];
            NSLog(@"%ld", result);
            // 0 (NSOrderedSame)
        }
        
        // Block9
        {
            NSString* upper = @"STRING";
            NSString* lower = @"string";
            
            NSComparisonResult result = [upper compare:lower options:NSCaseInsensitiveSearch];
            NSLog(@"%ld", result);
            // 0
            
            result = [upper compare:lower options:NSForcedOrderingSearch|NSCaseInsensitiveSearch];
            NSLog(@"%ld", result);
            // -1
        }
        
        // Block10
        {
            NSString* emailPattern = @"([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}";
            NSString* emailAddress = @"user@example.com";
            
            NSRange result = [emailAddress rangeOfString:emailPattern options:NSRegularExpressionSearch];
            if (result.location != NSNotFound) {
                NSLog(@"valid");
            } else {
                NSLog(@"invalid");
            }
            // valid
        }
    }
    return 0;
}
