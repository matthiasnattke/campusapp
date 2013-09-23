//
//  MensaUpdateViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "MensaUpdateViewController.h"
#import "Essen.h"
#import "DbConnect.h"
#import "DataFileToObjectParser.h"

@interface MensaUpdateViewController ()

@end

@implementation MensaUpdateViewController

@synthesize dbConnect, XMLactivity, essenListe;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    dbConnect = [[DbConnect alloc] init];
     
    //XML parsen
    [self performSelector: @selector(doXMLParsing)
               withObject: nil
               afterDelay: 0];
    return;
}

- (void) doXMLParsing
{
    //start new Thread

	
    
	essenListe = [[NSMutableArray alloc] init];
    
	NSURL *url = [NSURL URLWithString: @"http://www.studentenwerk-frankfurt.de/2011/ClassPackage/App_IKMZ_BTU/"];
	XMLToObjectParser *myParser = [[XMLToObjectParser alloc] parseXMLAtURL:url toObject:@"Tagesmenu" parseError:nil];
	
	for(int i = 0; i < [[myParser items] count]; i++) {
		Essen *new = [[Essen alloc] init];
		new = (Essen *)[[myParser items] objectAtIndex:i];
		[essenListe addObject:new];
    }
    //NSLog(@"%i", [essenListe count]);
    //Activity Indicator stop
    [XMLactivity stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)update {
    [dbConnect openDb];
    for(int i = 0; i < [essenListe count]; i++) {
        Essen *essen = [[Essen alloc] init];
        essen = [essenListe objectAtIndex:i];
        //NSLog(@"Tag: %@, Essen2: %@", essen.Wochentag, essen.Essen2);
        [dbConnect updateMensa:essen];
    }
    [dbConnect closeDb];
}

@end
