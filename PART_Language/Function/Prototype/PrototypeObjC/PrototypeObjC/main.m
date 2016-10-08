//
//  main.m
//  PrototypeObjC
//
//  Created by Keun young Kim on 2016. 9. 6..
//  Copyright © 2016년 Keun young Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger plusOne(NSInteger x);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger result = plusOne(1);
        NSLog(@"%ld", result);
    }
    return 0;
}

NSInteger plusOne(NSInteger x) {
    return x + 1;
}
