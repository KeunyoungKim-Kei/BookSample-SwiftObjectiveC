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
#import "DVDPlayer.h"
#import "Protocols.h"
#import "MP3Player.h"
#import "RemoteController.h"
#import "SmartTV.h"
#import "MacBook.h"
#import "AppleMusicDevice.h"
#import "AppleMediaDeviceCenter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AppleMediaDeviceCenter* repairCenter = [AppleMediaDeviceCenter new];
        
        SmartTV* lgSmartTV = [[SmartTV alloc] initWithModelName:@"LG Smart TV"];
        MP3Player* sonyWalkman = [[MP3Player alloc] initWithModelName:@"Sony Walkman"];
        AppleMusicDevice* iPodNano = [[AppleMusicDevice alloc] initWithModelName:@"iPod Nano"];
        MacBook* macBookPro = [[MacBook alloc] initWithModelName:@"MacBook Pro"];
        
        if ([repairCenter repairMediaDevice:lgSmartTV]) {
            NSLog(@"done");
        } else {
            NSLog(@"cannot repair");
        }
        // cannot repair
        
        if ([repairCenter repairMediaDevice:sonyWalkman]) {
            NSLog(@"done");
        } else {
            NSLog(@"cannot repair");
        }
        // cannot repair
        
        if ([repairCenter repairMediaDevice:macBookPro]) {
            NSLog(@"done");
        } else {
            NSLog(@"cannot repair");
        }
        // cannot repair
        
        if ([repairCenter repairMediaDevice:iPodNano]) {
            NSLog(@"done");
        } else {
            NSLog(@"cannot repair");
        }
        // AppleMusicDevice: call -[AppleMusicDevice checkAppleWarranty]
        // AppleMusicDevice: call -[AppleMusicDevice repair]
        // done
    }
    return 0;
}
