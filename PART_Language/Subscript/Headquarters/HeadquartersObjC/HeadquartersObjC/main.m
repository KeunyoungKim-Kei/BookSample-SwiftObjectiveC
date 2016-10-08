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
#import "SuperHero.h"
#import "Headquarters.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SuperHero* ironMan = [[SuperHero alloc] initWithHeroName:@"Iron Man" secretaryName:@"Jarvis"];
        SuperHero* thor = [[SuperHero alloc] initWithHeroName:@"Thor" secretaryName:nil];
        SuperHero* captainAmerica = [[SuperHero alloc] initWithHeroName:@"Captain America" secretaryName:nil];
        
        Headquarters* shield = [[Headquarters alloc] initWithHeroses:@[ironMan, thor]];
        [shield printSquad];
        // Iron Man, Thor
        
        SuperHero* firstHero = shield[0];
        NSLog(@"%@", firstHero.name);
        // Iron Man
        
        shield[0] = captainAmerica;
        firstHero = shield[0];
        NSLog(@"%@", firstHero.name);
        // Captain America
        
        SuperHero* hero = shield[@"Iron Man"];
        NSLog(@"%@", hero.name);
        // (null)
        
        shield[@"Iron Man"] = ironMan;
        hero = shield[@"Iron Man"];
        NSLog(@"%@", hero.name);
        // Iron Man
        
        [shield printSquad];
        // Captain America, Thor, Iron Man
        
        shield[0] = nil;
        [shield printSquad];
        // Thor, Iron Man
        
        shield[@"Thor"] = nil;
        [shield printSquad];
        // Iron Man
    }
    return 0;
}
