//
//  WebViewViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "WebViewViewController.h"

#import "TUSafariActivity.h"

@interface WebViewViewController () <UIPopoverControllerDelegate>{
    
        UIPopoverController *_popover;
    
}

@end

@implementation WebViewViewController
@synthesize webView;
@synthesize loadingSign;
@synthesize websiteName=_websiteName;

// zeige bei Bedarf den Ladekringel an und entferne ihn, wenn Seite geladen

-(void) webViewDidStartLoad:(UIWebView *)webView {
    [self.loadingSign startAnimating];
    self.loadingSign.hidden = NO;
}

-(void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.loadingSign stopAnimating];
    self.loadingSign.hidden = YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Rufe Webseiten-URL auf und zeige Sie im Webview
// Zeige bei Bedarf (auskommentiert) die Adresse in der oberen Bar an

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = self.websiteName;
    NSString *fullURL = self.websiteName;
    NSURL *websiteURL = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:websiteURL];
    [webView loadRequest:requestObj];
    
}

// Bei Verlassen Webseite wieder schließen

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setLoadingSign:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

// Orientierung festlegen

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// Übergibt URL an verschiedene Dienste und System-Apps weiter und öffnet diese dort.

- (IBAction) shareBtnAction:(UIButton *)sender {
    
    NSURL *URL = self.webView.request.URL;
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL] applicationActivities:@[[[TUSafariActivity alloc] init]]];
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		[self presentViewController:activityViewController animated:YES completion:nil];
	} else if (![_popover isPopoverVisible]) {
		_popover = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
		_popover.delegate = self;
		[_popover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	}
    
}


@end
