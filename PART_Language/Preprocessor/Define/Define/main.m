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

#define PI 3.14
#define MAX_VALUE(a, b) a < b ? b : a
#define WRONG_DOUBLE(a) a * 2
#define DOUBLE(a) (a) * 2

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%f", PI);
        // 3.14
        
        NSLog(@"%d", MAX_VALUE(1, 2));
        // 2
        
        int num = 1;
        NSLog(@"%d", WRONG_DOUBLE(num));
        // 2
        
        NSLog(@"%d", WRONG_DOUBLE(num + 2));
        // 5
        
        NSLog(@"%d", DOUBLE(num + 2));
        // 6
        
        NSLog(@"%d", MAX(1, 2));
        // 2
        
        NSLog(@"%d", MIN(1, 2));
        // 1
        
        NSLog(@"%d", ABS(-1));
        // 1
        
        NSLog(@"%s", __FILE__);
        // Path/to/main.m
        
        NSLog(@"%d", __LINE__);
        // (라인번호)
        
        NSLog(@"%s", __DATE__);
        // (현재 날짜)
        
        NSLog(@"%s", __TIME__);
        // (현재 시간)
        
        NSLog(@"%s", __TIMESTAMP__);
        // (현재 날짜와 시간)
    }
    return 0;
}
