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

class Person {
    var name: String
    var age: Int
    var portrait: NSData?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("Hello, World! I'm \(name)")
    }
}

class SuperHero: Person {
    var secretary: String?
    
    init(heroName: String, secretaryName: String? = nil) {
        secretary = secretaryName
        super.init(name: heroName, age: -1)
    }
    
    convenience init?(dict: [String: String]) {
        guard let name = dict["name"] else {
            return nil
        }
        
        guard let sName = dict["secretary"] else {
            return nil
        }
        
        self.init(heroName: name, secretaryName: sName)
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

let dict = ["a": "b"]
if let hero = SuperHero(dict: dict) {
    print("\(hero.name), at your sevice!")
} else {
    print("There's something wrong with super hero :(")
}
// There's something wrong with super hero :(
