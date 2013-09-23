//
// MensaViewController-old.m

#import "MensaViewController-old.h"

@implementation MensaViewController-old

@synthesize Essen1, Essen2, Essen3, Essen4, Sonderbar, Sonderbarbeschr, TitelText, Kurzbeschreibung, myProdukt, Kategorie;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

    //Scrolling for Description View
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(320, 500)];
    
	TitelText.text=myProdukt.Wochentag;
    Essen1.text=myProdukt.Essen1;
    Essen2.text=myProdukt.Essen2;
    Essen3.text=myProdukt.Essen3;
    Essen4.text=myProdukt.Essen4;
    Sonderbarbeschr.text=@"Bio-Essen";
    Sonderbar.text=myProdukt.Bio;
    
    //Check, if this Node really contains a 'Kurzbeschreibung', if not set
    //'Keine Daten hinterlegt'
    if ([Sonderbar.text=myProdukt.Bio isEqualToString:@""]) {
        Sonderbar.text=myProdukt.Aktionstag;
        Sonderbarbeschr.text=@"Aktionstag";
    }

    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
        return YES;
    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        return YES;
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return NO;
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
        return NO;
    
    return YES;
}


@end

