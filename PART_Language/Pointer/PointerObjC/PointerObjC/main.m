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
        int a = 7;
        int* ptr = &a;
        NSLog(@"%p", ptr);
        // 0x7fff5fbff7fc
        
        NSLog(@"%p", &a);
        // 0x7fff5fbff7fc
        
        
        int value = *ptr;
        NSLog(@"%d", value);
        // 7
        
        *ptr = 123;
        NSLog(@"%d", *ptr);
        // 123
        
        NSLog(@"%d", a);
        // 123
        
        int* nullPointer = NULL;
        NSLog(@"%p", nullPointer);
        // 0x0
        
        // Error
        //int nullValue = *nullPointer;
        //*nullPointer = 123;
        
        int b = 123;
        int* const constPtrToValue = &b;
        
        *constPtrToValue = 12345;
        NSLog(@"%d, %d", *constPtrToValue, b);
        // 12345, 12345
        
        // Error
        // constPtrToValue = &a;
        
        int c = 123;
        const int* ptrToConstValue = &c;
        
        NSLog(@"%d", *ptrToConstValue);
        // 123
        
        ptrToConstValue = &b;
        NSLog(@"%d", *ptrToConstValue);
        // 12345
        
        // Error
        //*ptrToConstValue = 7;
        
        b = 7;
        
        int* address = &a;
        NSLog(@"%p (%ld)", address, address);
        // 0x7fff5fbff7fc (140734799804412)
        
        NSLog(@"%p (%ld)", address + 1, address + 1);
        // 0x7fff5fbff800 (140734799804416)
        
        NSLog(@"%p (%ld)", address + 2, address + 2);
        // 0x7fff5fbff804 (140734799804420)
        
        char* str = "hello, pointer";
        char* ptrToString = str;
        while (*ptrToString != '\0') {
            NSLog(@"%c", *ptrToString);
            ++ptrToString;
        }
        // h
        // e
        // l
        // l
        // o
        // ,
        // p
        // o
        // i
        // n
        // t
        // e
        // t
        
        char thirdChar = *(str + 2);
        NSLog(@"%c", thirdChar);
        // l
    }
    return 0;
}
