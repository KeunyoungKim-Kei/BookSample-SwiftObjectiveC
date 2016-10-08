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
@property (weak, nonatomic) IBOutlet UITextField *stringValueField;
@property (weak, nonatomic) IBOutlet UITextField *numberValueField;

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

- (IBAction)sendValues:(id)sender {
    NSString* strVal = [self.stringValueField.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* numVal = [self.numberValueField.text stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* schemeStr = [NSString stringWithFormat:@"vv://default_host/default_path?str=%@&num=%@", strVal, numVal];
    
    [self openURL:schemeStr];
}

@end
