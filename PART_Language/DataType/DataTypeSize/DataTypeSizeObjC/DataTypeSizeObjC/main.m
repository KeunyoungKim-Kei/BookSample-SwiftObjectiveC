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
        NSLog(@"%-15s| %-11s | min ~ max", "name", "memory size");
        NSLog(@"==========================================================");
        NSLog(@"%-15s| %3zu byte(s) | %d ~ %d\n", "char", sizeof(char), CHAR_MIN, CHAR_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %d ~ %d\n", "unsigned char", sizeof(unsigned char), 0, UCHAR_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %d ~ %d\n", "short", sizeof(short), SHRT_MIN, SHRT_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %d ~ %d\n", "unsigned short", sizeof(unsigned short), 0, USHRT_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %d ~ %d\n", "int", sizeof(int), INT_MIN, INT_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %d ~ %u\n", "unsigned int", sizeof(unsigned int), 0, UINT_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %ld ~ %ld\n", "long", sizeof(long), LONG_MIN, LONG_MAX);

        NSLog(@"%-15s| %3zu byte(s) | %d ~ %ld\n", "unsigned long", sizeof(unsigned long), 0, ULONG_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %d ~ %lu\n", "unsigned long", sizeof(unsigned long), 0, ULONG_MAX);

        NSLog(@"%-15s| %3zu byte(s) | %f ~ %f\n", "float", sizeof(float), FLT_MIN, FLT_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %e ~ %e\n", "float", sizeof(float), FLT_MIN, FLT_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %g ~ %g\n", "float", sizeof(float), FLT_MIN, FLT_MAX);

        NSLog(@"%-15s| %3zu byte(s) | %f ~ %f\n", "double", sizeof(double), DBL_MIN, DBL_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %e ~ %e\n", "double", sizeof(double), DBL_MIN, DBL_MAX);
        NSLog(@"%-15s| %3zu byte(s) | %g ~ %g\n", "double", sizeof(double), DBL_MIN, DBL_MAX);

        NSLog(@"%-15s| %3zu byte(s) | -", "bool", sizeof(bool));
        NSLog(@"%-15s| %3zu byte(s) | -", "BOOL", sizeof(BOOL));
        NSLog(@"==========================================================");

        NSLog(@"Largest integer: %llu", SIZE_MAX);
    }
    return 0;
}
