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
            NSArray* fruits = @[@"Apple", @"Orange", @"Banana"];
            NSString* first = [fruits objectAtIndex:0];
            NSLog(@"%@", first);
            
            NSString* last = [fruits objectAtIndex:fruits.count - 1];
            NSLog(@"%@", last);
            
            // Apple
            // Banana
        }
        
        // Block2
        {
            NSArray* fruits = @[@"Apple", @"Orange", @"Banana"];
            NSString* first = fruits[0];
            NSString* last = fruits[fruits.count - 1];
        }
        
        // Block3
        {
            NSArray* fruits = @[@"Apple", @"Orange", @"Banana"];
            NSInteger index = 100;
            if (index >= 0 && index < fruits.count) {
                NSLog(@"%@", fruits[index]);
            } else {
                NSLog(@"Out of bounds");
            }
            // Out of bounds
        }
        
        // Block4
        {
            NSArray* fruits = @[@"Apple", @"Orange", @"Banana"];
            NSString* first = fruits.firstObject;
            if (first != nil) {
                // ...
            }
            
            NSString* last = fruits.lastObject;
            if (last != nil) {
                // ...
            }
        }
    }
    return 0;
}
