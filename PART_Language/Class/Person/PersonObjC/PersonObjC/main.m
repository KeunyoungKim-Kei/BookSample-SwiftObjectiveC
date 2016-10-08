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
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Block1
        {
            Person* p = [[Person alloc] init];
        }
        
        // Block2
        {
            Person* p = [Person new];
        }
        
        // Block3
        {
            Person* p1 = [[Person alloc] init];
            Person* p2 = [[Person alloc] init];

            if (p1 == p2) {
                NSLog(@"%@ == %@", p1, p2);
            } else {
                NSLog(@"%@ != %@", p1, p2);
            }
            // <Person: 0x100301580> != <Person: 0x1003031d0>

            if ([p1 isEqual:p2]) {
                NSLog(@"%@ == %@", p1, p2);
            } else {
                NSLog(@"%@ != %@", p1, p2);
            }
            // <Person: 0x100301580> != <Person: 0x1003031d0>
        }
        
        // Block4
        {
            Person* p1 = [[Person alloc] init];
            p1.name = @"James";
            p1.age = 34;

            Person* p2 = [[Person alloc] init];
            p2.name = @"James";
            p2.age = 34;

            Person* p3 = [[Person alloc] init];
            p3.name = @"Steve";
            p3.age = 50;

            if (p1 == p2) {
                NSLog(@"%@ == %@", p1, p2);
            } else {
                NSLog(@"%@ != %@", p1, p2);
            }
            // <Person: 0x100303800> != <Person: 0x1003038a0>

            if ([p1 isEqualToPerson:p2]) {
                NSLog(@"%@ == %@", p1, p2);
            } else {
                NSLog(@"%@ != %@", p1, p2);
            }
            // <Person: 0x100303800> == <Person: 0x1003038a0>

            if ([p1 isEqualToPerson:p3]) {
                NSLog(@"%@ == %@", p1, p3);
            } else {
                NSLog(@"%@ != %@", p1, p3);
            }
            // <Person: 0x100303800> != <Person: 0x1003037d0>
        }
        
        // Block5
        {
            Person* p1 = [[Person alloc] init];
            p1.name = @"James";
            p1.age = 34;

            Person* p2 = [[Person alloc] init];
            p2.name = @"Steve";
            p2.age = 50;

            switch ([p1 compare:p2]) {
                case NSOrderedAscending:
                    NSLog(@"%d < %d", p1.age, p2.age);
                    break;
                case NSOrderedDescending:
                    NSLog(@"%d > %d", p1.age, p2.age);
                    break;
                case NSOrderedSame:
                    NSLog(@"%d == %d", p1.age, p2.age);
                    break;
            }
            // 34 < 50
        }
        
        // Block6
        {
            Person* p = [[Person alloc] init];
            Class objectClass = [NSObject class];
            Class personClass = [Person class];
            if ([p isKindOfClass:objectClass]) {
                NSLog(@"p isKindOfClass NSObject: YES");
            } else {
                NSLog(@"p isKindOfClass NSObject: NO");
            }
            // p isKindOfClass NSObject: YES
            
            if ([p isMemberOfClass:objectClass]) {
                NSLog(@"p isMemberOfClass NSObject: YES");
            } else {
                NSLog(@"p isMemberOfClass NSObject: NO");
            }
            // p isMemberOfClass NSObject: NO
            
            if ([p isKindOfClass:personClass]) {
                NSLog(@"p isKindOfClass Person: YES");
            } else {
                NSLog(@"p isKindOfClass Person: NO");
            }
            // p isKindOfClass Person: YES
            
            if ([p isMemberOfClass:personClass]) {
                NSLog(@"p isMemberOfClass Person: YES");
            } else {
                NSLog(@"p isMemberOfClass Person: NO");
            }
            // p isMemberOfClass Person: YES
        }
        
        
    }
    return 0;
}
