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

class Device: NSObject {
    var modelName: String;
    
    init(name: String) {
        modelName = name
    }
}

@objc protocol MediaPlayable {
    func play()
    func pause()
    func stop()
    
    @objc optional func nextMedia()
    @objc optional func prevMedia()
}

@objc protocol RemoteControllable: MediaPlayable {
    static var firmwareVersion: String { get }
    var isOn: Bool { get set }
    
    func on()
    func off()
    func volumeUp()
    func volumeDown()
    
    @objc optional func nextChannel()
    @objc optional func prevChannel()
}

@objc class DVDPlayer: Device, MediaPlayable, RemoteControllable {
    static var firmwareVersion: String = "1.0"
    var isOn: Bool = false
    
    func play() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
    
    func pause() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
    
    func stop() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
    
    func on() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
    
    func off() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
    
    func volumeUp() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
    
    func volumeDown() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
    
    func eject() {
        #if swift(>=3.0)
            print("\(String(describing: DVDPlayer.self)): call \(#function)")
        #else
            print("\(String(DVDPlayer.self)): call \(#function)")
        #endif
    }
}

@objc class MP3Player: Device, MediaPlayable {
    func play() {
        #if swift(>=3.0)
            print("\(String(describing: MP3Player.self)): call \(#function)")
        #else
            print("\(String(MP3Player.self)): call \(#function)")
        #endif
    }
    
    func pause() {
        #if swift(>=3.0)
            print("\(String(describing: MP3Player.self)): call \(#function)")
        #else
            print("\(String(MP3Player.self)): call \(#function)")
        #endif
    }
    
    func stop() {
        #if swift(>=3.0)
            print("\(String(describing: MP3Player.self)): call \(#function)")
        #else
            print("\(String(MP3Player.self)): call \(#function)")
        #endif
    }
    
    func nextMedia() {
        #if swift(>=3.0)
            print("\(String(describing: MP3Player.self)): call \(#function)")
        #else
            print("\(String(MP3Player.self)): call \(#function)")
        #endif
    }
    
    func prevMedia() {
        #if swift(>=3.0)
            print("\(String(describing: MP3Player.self)): call \(#function)")
        #else
            print("\(String(MP3Player.self)): call \(#function)")
        #endif
    }
}

@objc class SmartTV: Device, RemoteControllable {
    static var firmwareVersion: String = "1.0"
    var isOn: Bool = false
    var volume = 0
    
    func play() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func pause() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func stop() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func nextMedia() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func prevMedia() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func on() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func off() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func volumeUp() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
        
        volume = min(100, volume + 1)
        
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): volume \(volume)")
        #else
            print("\(String(SmartTV.self)): volume \(volume)")
        #endif
    }
    
    func volumeDown() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
        
        volume = max(0, volume - 1)
        
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): volume \(volume)")
        #else
            print("\(String(SmartTV.self)): volume \(volume)")
        #endif
    }
    
    func nextChannel() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
    
    func prevChannel() {
        #if swift(>=3.0)
            print("\(String(describing: SmartTV.self)): call \(#function)")
        #else
            print("\(String(SmartTV.self)): call \(#function)")
        #endif
    }
}

@objc class RemoteController: Device {
    var pairedDevice: RemoteControllable?
    static var firmwareVersion: String = "1.0"
    var isOn: Bool = false
    
    func play() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.play()
    }
    
    func pause() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.pause()
    }
    
    func stop() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.stop()
    }
    
    func nextMedia() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.nextMedia!()
    }
    
    func prevMedia() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.prevMedia!()
    }
    
    func on() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.on()
    }
    
    func off() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.off()
    }
    
    func volumeUp() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.volumeUp()
    }
    
    func volumeDown() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.volumeDown()
    }
    
    func nextChannel() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.nextChannel!()
    }
    
    func prevChannel() {
        guard let paired = pairedDevice else {
            return
        }
        
        paired.prevChannel!()
    }
    
    func pair(with device: RemoteControllable) -> Bool {
        pairedDevice = device
        return true
    }
}

let magicRemote = RemoteController(name: "Magic Remote Controller")

let lgSmartTV = SmartTV(name: "LG 60LF6500")
let iPod = MP3Player(name: "Apple iPod nano")
let sonyDVDPlayer = DVDPlayer(name: "SONY DVD-D01")

if magicRemote.pair(with: lgSmartTV) {
    magicRemote.on()
    magicRemote.volumeUp()
    magicRemote.volumeUp()
    magicRemote.nextChannel()
    magicRemote.off()
} else {
    print("Pairing Failed")
}
// SmartTV: call on()
// SmartTV: call volumeUp()
// SmartTV: volume 1
// SmartTV: call volumeUp()
// SmartTV: volume 2
// SmartTV: call nextChannel()
// SmartTV: call off()

if magicRemote.pair(with: sonyDVDPlayer) {
    magicRemote.on()
    magicRemote.play()
    magicRemote.nextChannel()   // Error
    magicRemote.stop()
    magicRemote.off()
} else {
    print("Pairing Failed")
}

// DVDPlayer: call on()
// DVDPlayer: call play()
// -[__lldb_expr_62.DVDPlayer nextChannel]: unrecognized selector sent to instance 0x7f8ffb60f200
