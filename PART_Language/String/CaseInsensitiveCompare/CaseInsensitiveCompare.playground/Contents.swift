//: Playground - noun: a place where people can play

import UIKit

let a: NSString = "Apple"
let b = "apple"

#if swift(>=3.0)
if (a.caseInsensitiveCompare(b) == ComparisonResult.orderedSame) {
    print("Equal")
} else {
    print("Not Equal")
}
#else
    if (a.caseInsensitiveCompare(b) == NSComparisonResult.OrderedSame) {
    print("Equal")
    } else {
    print("Not Equal")
    }
#endif

// Equal
