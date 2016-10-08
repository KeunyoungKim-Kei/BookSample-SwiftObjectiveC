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

import UIKit

let str = "america"

#if swift(>=3.0)
let korean = str.applyingTransform(StringTransform.latinToHangul, reverse: false)
#else
    let korean = str.stringByApplyingTransform(NSStringTransformLatinToHangul, reverse: false)
#endif

print(korean)
// 아메맃아

#if swift(>=3.0)
let hiragana = str.applyingTransform(StringTransform.latinToHiragana, reverse: false)
#else
    let hiragana = str.stringByApplyingTransform(NSStringTransformLatinToHiragana, reverse: false)
#endif

print(hiragana)
// あめりか

#if swift(>=3.0)
let katakana = str.applyingTransform(StringTransform.latinToKatakana, reverse: false)
#else
    let katakana = str.stringByApplyingTransform(NSStringTransformLatinToKatakana, reverse: false)
#endif

print(katakana)
// アメリカ
