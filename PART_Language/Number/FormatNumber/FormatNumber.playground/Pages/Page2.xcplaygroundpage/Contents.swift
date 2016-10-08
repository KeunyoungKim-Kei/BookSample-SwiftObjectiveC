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

#if swift(>=3.0)
let styles = [NumberFormatter.Style.decimal,
              NumberFormatter.Style.currency,
              NumberFormatter.Style.percent,
              NumberFormatter.Style.scientific,
              NumberFormatter.Style.spellOut,
              NumberFormatter.Style.ordinal,
              NumberFormatter.Style.currencyISOCode,
              NumberFormatter.Style.currencyPlural,
              NumberFormatter.Style.currencyAccounting]
    
let num = NSNumber(value: 123)
let formatter = NumberFormatter()
formatter.locale = Locale(identifier: "Ko-kr")
    
for style in styles {
    formatter.numberStyle = style
    
    if let result = formatter.string(from: num) {
        print(result);
    }
}
#else
    let styles = [NSNumberFormatterStyle.DecimalStyle,
    NSNumberFormatterStyle.CurrencyStyle,
    NSNumberFormatterStyle.PercentStyle,
    NSNumberFormatterStyle.ScientificStyle,
    NSNumberFormatterStyle.SpellOutStyle,
    NSNumberFormatterStyle.OrdinalStyle,
    NSNumberFormatterStyle.CurrencyISOCodeStyle,
    NSNumberFormatterStyle.CurrencyPluralStyle,
    NSNumberFormatterStyle.CurrencyAccountingStyle]
    
    let num = NSNumber(integer: 123)
    let formatter = NSNumberFormatter()
    formatter.locale = NSLocale(localeIdentifier: "Ko-kr")
    
    for style in styles {
        formatter.numberStyle = style
        
        if let result = formatter.stringFromNumber(num) {
            print(result);
        }
    }
#endif
