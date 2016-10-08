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

import Foundation

NSLog("%-15s| %-11s | min ~ max\n", "name".cStringUsingEncoding(NSUTF8StringEncoding), "memory size".cStringUsingEncoding(NSUTF8StringEncoding))
NSLog("===============================================\n");
NSLog("%-15s| %3zu byte(s) | %d ~ %d\n", "Int8".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Int8), Int8.min, Int8.max)
NSLog("%-15s| %3zu byte(s) | %d ~ %d\n", "UInt8".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(UInt8), UInt8.min, UInt8.max)
NSLog("%-15s| %3zu byte(s) | %d ~ %d\n", "Int16".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Int16), Int16.min, Int16.max)
NSLog("%-15s| %3zu byte(s) | %d ~ %d\n", "UInt16".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(UInt16), UInt16.min, UInt16.max)
NSLog("%-15s| %3zu byte(s) | %d ~ %d\n", "Int32".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Int32), Int32.min, Int32.max)
NSLog("%-15s| %3zu byte(s) | %d ~ %u\n", "UInt32".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(UInt32), UInt32.min, UInt32.max)
NSLog("%-15s| %3zu byte(s) | %ld ~ %ld\n", "Int64".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Int64), Int64.min, Int64.max)
NSLog("%-15s| %3zu byte(s) | %lu ~ %lu\n", "UInt64".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(UInt64), UInt64.min, UInt64.max)
NSLog("%-15s| %3zu byte(s) | %f ~ %f\n", "Float".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Float), FLT_MIN, FLT_MAX)
NSLog("%-15s| %3zu byte(s) | %e ~ %e\n", "Float".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Float), FLT_MIN, FLT_MAX)
NSLog("%-15s| %3zu byte(s) | %g ~ %g\n", "Float".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Float), FLT_MIN, FLT_MAX)
NSLog("%-15s| %3zu byte(s) | %f ~ %f\n", "Double".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Double), DBL_MIN, DBL_MAX)
NSLog("%-15s| %3zu byte(s) | %e ~ %e\n", "Double".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Double), DBL_MIN, DBL_MAX)
NSLog("%-15s| %3zu byte(s) | %g ~ %g\n", "Double".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Double), DBL_MIN, DBL_MAX)
NSLog("%-15s| %3zu byte(s) | -", "Bool".cStringUsingEncoding(NSUTF8StringEncoding), sizeof(Bool));
NSLog("===============================================\n")
NSLog("Largest integer: %llu", SIZE_MAX)

