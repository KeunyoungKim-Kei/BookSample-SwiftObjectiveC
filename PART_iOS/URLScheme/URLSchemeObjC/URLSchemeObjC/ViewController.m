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

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)openURL:(NSString*)urlString {
    NSURL* url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    if (url && [[UIApplication sharedApplication] canOpenURL:url]) {
        // iOS 10
        if ([UIApplication instancesRespondToSelector:@selector(openURL:options:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
                if (success) {
                    // Success
                }
            }];
        }
        // iOS 9 or lower
        else {
            if ([[UIApplication sharedApplication] openURL:url]) {
                // Success
            }
        }
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"URL Schemes" message:@"사용할 수 없는 URL Scheme 입니다." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (IBAction)openWebsite:(id)sender {
    [self openURL:@"https://www.apple.com"];
}

- (IBAction)openEmail:(id)sender {
    [self openURL:@"mailto:userid@example.com"];
}

- (IBAction)openPhone:(id)sender {
    [self openURL:@"tel:010-0000-0000"];
}
- (IBAction)openMessage:(id)sender {
    [self openURL:@"sms:010-0000-0000"];
}

- (IBAction)openFaceTime:(id)sender {
    [self openURL:@"facetime://userid@example.com"];
}

- (IBAction)openFaceTimeAudio:(id)sender {
    [self openURL:@"facetime-audio://userid@example.com"];
}

- (IBAction)openMap:(id)sender {
    [self openURL:@"http://maps.apple.com/?q=LA+dodgers+stadium"];
}


- (IBAction)openAppStore:(id)sender {
    //https://itunes.apple.com/kr/app/wwdc/id640199958?mt=8
    [self openURL:@"itms://itunes.apple.com/us/app/apple-store/id640199958?mt=8"];
}

@end
