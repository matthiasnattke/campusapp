//
//  LehrstuhlViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "LehrstuhlViewController.h"
#import "WebViewViewController.h"
#import "DbConnect.h"
#import "FakViewController.h"

@interface LehrstuhlViewController ()

@end

@implementation LehrstuhlViewController

@synthesize lehrstuhl,lsNameLabel, lsFakLabel, lsInstituteLabel, lsFavLabel, dbConnect, scroll, website;

-(IBAction)likeAndDelike {
    // fügt Favoritmarkierng hinzu
    if(!lehrstuhl.fav) {
        lehrstuhl.fav = YES;
        lsFavLabel.text = @"Ist nun Favorit";
        // dauerhafte Speicherung
        [dbConnect openDb];
        
        if([dbConnect saveLSFav:lehrstuhl.name inTable:lehrstuhl.fakDB]) {
            UIAlertView *alert;
            alert = [[UIAlertView alloc] initWithTitle:@"Markierung erfolgreich!!" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else {
            UIAlertView *alert;
            alert = [[UIAlertView alloc] initWithTitle:@"Fehler in der Datenbank" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
        [dbConnect closeDb];
    }
    // Löscht Favoritmarkierung
    else {
        lehrstuhl.fav = NO;
        lsFavLabel.text = @"Ist kein Favorit mehr";
        // dauerhafte Speicherung
        [dbConnect openDb];
        
        if([dbConnect deleteLSFav:lehrstuhl.name inTable:lehrstuhl.fakDB]) {
            UIAlertView *alert;
            alert = [[UIAlertView alloc] initWithTitle:@"Aufhebung erfolgreich!!" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else {
            UIAlertView *alert;
            alert = [[UIAlertView alloc] initWithTitle:@"Fehler in der Datenbank" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
        [dbConnect closeDb];

    }
}



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
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [scroll setScrollEnabled:YES];
	lsNameLabel.text = lehrstuhl.name;
    lsInstituteLabel.text = lehrstuhl.institute;
    lsFakLabel.text = lehrstuhl.fak;
    
    // versteckt Knopf, wenn es keinen Link gibt
    website.hidden = [lehrstuhl.url isEqualToString:@""];
    
    if(lehrstuhl.fav) {
        lsFavLabel.text = @"Favorit";
    }
    else {
        lsFavLabel.text = @"Kein Favorit";
    }
    
    dbConnect = [[DbConnect alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowWebsite"]) {
        WebViewViewController *website = [segue destinationViewController];
        
        website.websiteName = lehrstuhl.url;
        
    }
    
}


@end
