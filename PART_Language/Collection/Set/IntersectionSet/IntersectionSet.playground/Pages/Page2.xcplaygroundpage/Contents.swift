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

let favoriteFruits = Set(["Apple", "Orange", "Melon", "Kiwi"])
var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])

#if swift(>=3.0)
if favoriteFruits.isDisjoint(with: tropicalFruits) {
    print("favoriteFruits ∩ tropicalFruits = ∅")
} else {
    print("favoriteFruits ∩ tropicalFruits")
}
#else
if favoriteFruits.isDisjointWith(tropicalFruits) {
    print("favoriteFruits ∩ tropicalFruits = ∅")
} else {
    print("favoriteFruits ∩ tropicalFruits")
}
#endif

// favoriteFruits ∩ tropicalFruits

#if swift(>=3.0)
let commonSet = favoriteFruits.intersection(tropicalFruits)
#else
let commonSet = favoriteFruits.intersect(tropicalFruits)
#endif

print(commonSet)
// {"Kiwi"}

#if swift(>=3.0)
tropicalFruits.formIntersection(favoriteFruits)
#else
tropicalFruits.intersectInPlace(favoriteFruits)
#endif

print(tropicalFruits)
// {"Kiwi"}
