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

#import "StringOperation.h"

@implementation StringOperation

- (instancetype)initWithUrlString:(NSString *)urlStr {
    self = [super init];
    if (self) {
        _targetUrl = [NSURL URLWithString:urlStr];
    }
    
    return self;
}

- (void)main {
    @autoreleasepool {
        if (self.isCancelled) {
            return;
        }
        
        if (self.targetUrl) {
            NSError* error = nil;
            NSString* str = [NSString stringWithContentsOfURL:self.targetUrl encoding:NSUTF8StringEncoding error:&error];
            
            if (self.isCancelled) {
                return;
            }
            
            if (!error) {
                NSArray* list = [str componentsSeparatedByString:@"\n"];
                
                if (self.isCancelled) {
                    return;
                }
                
                for (NSString* str in list) {
                    if (self.isCancelled) {
                        return;
                    }
                    
                    NSString* trimmedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                    if ([trimmedString length] > 5) {
                        trimmedString = [trimmedString substringToIndex:4];
                    }
                    
                    NSLog(@"%@ => %@", trimmedString, trimmedString.uppercaseString);
                    
                    [NSThread sleepForTimeInterval:0.003];
                }
            }
        }
    }
}

@end
