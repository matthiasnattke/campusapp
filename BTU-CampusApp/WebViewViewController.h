//
//  WebViewViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController <UIWebViewDelegate> {
    NSString *websiteName;
}
@property (copy, nonatomic) NSString * websiteName;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingSign;
//- (IBAction)Safari:(id)sender;
- (IBAction) shareBtnAction:(UIButton *)sender;

@end