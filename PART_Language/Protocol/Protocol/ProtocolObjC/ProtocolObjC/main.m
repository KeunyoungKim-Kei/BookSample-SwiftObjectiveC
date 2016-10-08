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
#import "Protocols.h"
#import "MP3Player.h"
#import "SmartTV.h"
#import "RemoteController.h"
#import "DVDPlayer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Block1
        {
            if ([MP3Player conformsToProtocol:@protocol(RemoteControllable)]) {
                NSLog(@"conforming to %@", NSStringFromProtocol(@protocol(RemoteControllable)));
            } else {
                NSLog(@"not conforming to %@", NSStringFromProtocol(@protocol(RemoteControllable)));
            }
            // not conforming to RemoteControllable
            
            if ([SmartTV conformsToProtocol:@protocol(RemoteControllable)]) {
                NSLog(@"conforming to %@", NSStringFromProtocol(@protocol(RemoteControllable)));
            } else {
                NSLog(@"not conforming to %@", NSStringFromProtocol(@protocol(RemoteControllable)));
            }
            // conforming to RemoteControllable
        }
        
        // Block2
        {
            RemoteController* magicRemote = [[RemoteController alloc] initWithModelName:@"Magic Remote Controller"];
            
            SmartTV* lgSmartTV = [[SmartTV alloc] initWithModelName:@"LG 60LF6500"];
            MP3Player* iPod = [[MP3Player alloc] initWithModelName:@"Apple iPod nano"];
            DVDPlayer* sonyDVDPlayer = [[DVDPlayer alloc] initWithModelName:@"SONY DVD-D01"];
            
            if ([magicRemote pairWith:lgSmartTV]) {
                [magicRemote on];
                [magicRemote volumeUp];
                [magicRemote volumeUp];
                [magicRemote nextChannel];
                [magicRemote off];
            } else {
                NSLog(@"Pairing Failed");
            }
            // SmartTV: call -[SmartTV on]
            // SmartTV: call -[SmartTV volumeUp]
            // SmartTV: volume 1
            // SmartTV: call -[SmartTV volumeUp]
            // SmartTV: volume 2
            // SmartTV: call -[SmartTV nextChannel]
            // SmartTV: call -[SmartTV off]
            
            if ([magicRemote pairWith:iPod]) {
                [magicRemote on];
                [magicRemote off];
            } else {
                NSLog(@"Pairing Failed");
            }
            // Pairing Failed
            
            if ([magicRemote pairWith:sonyDVDPlayer]) {
                [magicRemote on];
                [magicRemote play];
                [magicRemote nextChannel];  // Error
                [magicRemote stop];
                [magicRemote off];
            }  else {
                NSLog(@"Pairing Failed");
            }
            // DVDPlayer: call -[DVDPlayer on]
            // DVDPlayer: call -[DVDPlayer play]
            // -[DVDPlayer nextChannel]: unrecognized selector sent to instance 0x100102930
        }
    }
    return 0;
}
