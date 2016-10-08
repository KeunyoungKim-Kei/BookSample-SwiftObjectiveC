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

class StringOperation: NSOperation {
    var targetUrl: NSURL?
    
    init(urlString: String) {
        targetUrl = NSURL(string: urlString, relativeToURL: nil)
        
        super.init()
    }
    
    override func main() {
        autoreleasepool { 
            if cancelled {
                return
            }
            
            if let targetUrl = targetUrl {
                do {
                    let str = try NSString(contentsOfURL: targetUrl, encoding: NSUTF8StringEncoding)
                    
                    if cancelled {
                        return
                    }
                    
                    let list = str.componentsSeparatedByString("\n")
                    
                    if cancelled {
                        return
                    }
                    
                    for str in list {
                        if cancelled {
                            return
                        }
                        
                        var trimmedString = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
                        if trimmedString.characters.count > 5 {
                            trimmedString = trimmedString.substringToIndex(trimmedString.startIndex.advancedBy(4))
                        }
                        
                        print("\(trimmedString) => \(trimmedString.uppercaseString)")
                        
                        NSThread.sleepForTimeInterval(0.003)
                    }
                    
                } catch {
                    return
                }
            }
        }
    }
}
