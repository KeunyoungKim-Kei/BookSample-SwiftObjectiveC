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

class Headquarters {
    private var squad: [SuperHero]
    
    init(heroes: [SuperHero]) {
        squad = heroes
    }
    
    subscript(index: Int) -> SuperHero? {
        get {
            if index < squad.count {
                return squad[index]
            }
            
            return nil
        }
        set {
            if let hero = newValue {
                if index < squad.count {
                    squad[index] = hero
                } else {
                    squad.append(hero)
                }
            } else {
                if index < squad.count {
                    #if swift(>=3.0)
                    squad.remove(at: index)
                    #else
                    squad.removeAtIndex(index)
                    #endif
                }
            }
        }
    }
    
    subscript(key: String) -> SuperHero? {
        get {
            for hero in squad {
                if hero.name == key {
                    return hero
                }
            }
            
            return nil
        }
        set {
            #if swift(>=3.0)
                if let index = squad.index(where: { $0.name == key }) {
                if let hero = newValue {
                    squad[index] = hero
                } else {
                    squad.remove(at: index)
                }
            } else {
                if let hero = newValue {
                    squad.append(hero)
                }
            }
            #else
            if let index = squad.indexOf({ $0.name == key }) {
                if let hero = newValue {
                    squad[index] = hero
                } else {
                    squad.removeAtIndex(index)
                }
            } else {
                if let hero = newValue {
                    squad.append(hero)
                }
            }
            #endif
        }
    }
    
    func printSquad() {
        var list = [String]()
        for hero in squad {
            list.append(hero.name)
        }
        
        #if swift(>=3.0)
        print(list.joined(separator: ", "))
        #else
        print(list.joinWithSeparator(", "))
        #endif
    }
}

let ironMan = SuperHero(heroName: "Iron Man", secretaryName: "Jarvis")
let thor = SuperHero(heroName: "Thor")
let captainAmerica = SuperHero(heroName: "Captain America")

let shield = Headquarters(heroes: [ironMan, thor])
shield.printSquad()
// Iron Man, Thor

var firstHero = shield[0]
print(firstHero?.name)
// Iron Man

shield[0] = captainAmerica
firstHero = shield[0]
print(firstHero?.name)
// Captain America

var hero = shield["Iron Man"]
print(hero?.name)
// nil

shield["Iron Man"] = ironMan
hero = shield["Iron Man"]
print(hero?.name)
// Iron Man

shield.printSquad()
// Captain America, Thor, Iron Man

shield[0] = nil
shield.printSquad()
// Thor, Iron Man

shield["Thor"] = nil
shield.printSquad()
// Iron Man
