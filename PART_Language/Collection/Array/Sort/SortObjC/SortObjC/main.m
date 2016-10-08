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
        NSMutableArray* alphabet = [NSMutableArray arrayWithArray:@[@"A", @"B", @"C", @"a", @"b", @"c"]];
        
        NSUInteger count = [alphabet count];
        for (NSUInteger i = 0; i < count - 1; ++i) {
            NSInteger remainingCount = count - i;
            NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
            [alphabet exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
        }
        
        NSLog(@"%@", alphabet);
        // ["C", "b", "a", "c", "B", "A"]
        
        NSArray* sortedArray = [alphabet sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSLog(@"%@", sortedArray);
        // ["a", "A", "B", "b", "C", "c"]
        
        [alphabet sortUsingSelector:@selector(caseInsensitiveCompare:)];
        NSLog(@"%@", alphabet);
        // ["a", "A", "B", "b", "C", "c"]
    }
    return 0;
}
