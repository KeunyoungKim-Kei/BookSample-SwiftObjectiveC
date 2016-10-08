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
            NSArray* array = @[@"Apple", @"Orange", @"Melon"];
            for (NSString* obj in array) {
                NSUInteger index = [array indexOfObject:obj];
                NSLog(@"%ld - %@", index, obj);
            }
            // 0 - Apple
            // 1 - Orange
            // 2 - Melon
            
            NSSet* set = [NSSet setWithArray:array];
            for (NSString* obj in set) {
                NSLog(@"%@", obj);
            }
            // Apple
            // Melon
            // Orange
        }
        
        // Block2
        {
            NSArray* array = @[@"Apple", @"Orange", @"Melon"];
            for (NSString* obj in [array reverseObjectEnumerator]) {
                NSUInteger index = [array indexOfObject:obj];
                NSLog(@"%ld - %@", index, obj);
            }
            // 2 - Melon
            // 0 - Apple
            // 1 - Orange
        }
        
        // Block3
        {
            NSArray* array = @[@"Apple", @"Orange", @"Melon"];
            NSMutableArray* bigArray = [NSMutableArray arrayWithArray:array];
            
            for (int i = 0; i < 20; i++) {
                [bigArray addObjectsFromArray:array];
            }
            
            NSLog(@"== Normal Order");
            [bigArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%ld - %@", idx, obj);
            }];
            
            NSLog(@"\n");
            NSLog(@"== Reverse Order");
            [bigArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@"%ld - %@", idx, obj);
            }];
            
            NSLog(@"\n");
            NSLog(@"== Concurrent");
            [bigArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSLog(@">> %ld - %@", idx, obj);
            }];
        }
        
        // Block4
        {
            NSDictionary* dict = @{@"A": @"Apple", @"B": @"Banana", @"C": @"City"};
            for (NSString* key in dict) {
                NSLog(@"%@: %@", key, dict[key]);
            }
            // A: Apple
            // B: Banana
            // C: City
        }
        
        // Block5
        {
            NSDictionary* dict = @{@"A": @"Apple", @"B": @"Banana", @"C": @"City"};
            NSEnumerator* keyEnumerator = [dict keyEnumerator];
            id key;
            while ((key = [keyEnumerator nextObject])) {
                NSLog(@"%@", key);
            }
            // A
            // B
            // C
            
            NSEnumerator* valueEnumerator = [dict objectEnumerator];
            id value;
            while ((value = [valueEnumerator nextObject])) {
                NSLog(@"%@", value);
            }
            // Apple
            // Banana
            // City
            
            [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                // ...
            }];
            
            [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                // ...
            }];
        }
        
        // Block6
        {
            NSMutableArray* array = [NSMutableArray arrayWithObjects:@"Apple", @"Orange", @"Melon", @"Apple", @"Orange", @"Melon", nil];
            NSMutableSet* deleteSet = [NSMutableSet set];
            
            for (NSString* obj in array) {
                if ([obj isEqualToString:@"Melon"]) {
                    [deleteSet addObject:obj];
                }
            }
            
            for (NSString* obj in deleteSet) {
                [array removeObject:obj];
            }
            
            NSLog(@"%@", array);
            // ["Apple", "Orange", "Apple", "Orange"]
        }
    }
    return 0;
}
