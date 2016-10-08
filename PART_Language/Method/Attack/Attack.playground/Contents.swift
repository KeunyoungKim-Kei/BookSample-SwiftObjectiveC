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

class SuperHero {
    var name: String
    var secretary: String?
    
    init(heroName: String, secretaryName: String? = nil) {
        name = heroName
        secretary = secretaryName
    }
    
    func callSecretary() {
        if let name = secretary {
            print("Hey, \(name)!")
        } else {
            print("\(name) is working alone.")
        }
    }
    
    func attack(weapon: String, target: String?) -> Bool {
        if let target = target {
            callSecretary()
            print("Attack \(target) with \(weapon)!!!")
            return true
        }
        
        return false
    }
}

let ironMan = SuperHero(heroName: "Iron Man", secretaryName: "Jarvis")
ironMan.callSecretary()

#if swift(>=3.0)
ironMan.attack(weapon: "Repulsor Beam", target: "Mandarin")
#else
ironMan.attack("Repulsor Beam", target: "Mandarin")
#endif

// Hey, Jarvis!
// Hey, Jarvis!
// Attack Mandarin with Repulsor Beam!!!

let thor = SuperHero(heroName: "Thor")
thor.callSecretary()

#if swift(>=3.0)
thor.attack(weapon: "Mjölnir", target: "Laufey")
#else
thor.attack("Mjölnir", target: "Laufey")
#endif

// Thor is working along.
// Thor is working along.
// Attack Laufey with Mjölnir!!!
