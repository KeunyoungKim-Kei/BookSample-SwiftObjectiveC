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

#import "Headquarters.h"
#import "SuperHero.h"

@interface Headquarters()
@property (strong, nonatomic) NSMutableArray* squad;
@end

@implementation Headquarters
- (instancetype)initWithHeroses:(NSArray*)heroArray {
    self = [super init];
    if (self) {
        _squad = [[NSMutableArray alloc] initWithArray:heroArray];
    }
    
    return self;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx < self.squad.count) {
        return self.squad[idx];
    }
    
    return nil;
}

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    if (obj) {
        if (idx < self.squad.count) {
            [self.squad replaceObjectAtIndex:idx withObject:obj];
        } else {
            [self.squad insertObject:obj atIndex:idx];
        }
    } else {
        if (idx < self.squad.count) {
            [self.squad removeObjectAtIndex:idx];
        }
    }
}

- (id)objectForKeyedSubscript:(id)key {
    for (SuperHero* hero in self.squad) {
        if ([hero.name isEqualToString:key]) {
            return hero;
        }
    }
    
    return nil;
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    NSUInteger index = [self.squad indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SuperHero* hero = (SuperHero*)obj;
        if ([hero.name isEqualToString:key]) {
            *stop = YES;
            return YES;
        }
        
        return NO;
    }];
    
    if (index != NSNotFound) {
        if (obj) {
            self.squad[index] = obj;
        } else {
            [self.squad removeObjectAtIndex:index];
        }
        
    } else {
        if (obj) {
            [self.squad addObject:obj];
        }
    }
}

- (void)printSquad {
    NSMutableArray* list = [[NSMutableArray alloc] init];
    for (SuperHero* hero in self.squad) {
        [list addObject:hero.name];
    }
    
    NSLog(@"%@", [list componentsJoinedByString:@", "]);
}
@end
