//
//  MensaViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "MensaViewController.h"

@interface MensaViewController ()

@end

@implementation MensaViewController

@synthesize essen, scroll;

@synthesize Wochentag, Essen1, Essen2, Essen3, Essen4, ess1Label, ess2Label, ess3Label, ess4Label, Bio,bioLabel, actLabel, Aktionstag, geschlossen;

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
    
    [scroll setScrollEnabled:YES];
    Wochentag.text = essen.Wochentag;
    
    // Überprüfung, was es gibt
    BOOL ess1Leer = [essen.Essen1 isEqualToString:@""];
    BOOL ess2Leer = [essen.Essen2 isEqualToString:@""];
    BOOL ess3Leer = [essen.Essen3 isEqualToString:@""];
    BOOL ess4Leer = [essen.Essen4 isEqualToString:@""];
    BOOL bioLeer = [essen.Bio isEqualToString:@""];
    BOOL actLeer = [essen.Aktionstag isEqualToString:@""];
    
    if(ess1Leer && ess2Leer && ess3Leer && ess4Leer && bioLeer && actLeer) {
        geschlossen.text = @"Die Mensa ist an Feiertagen geschlossen.";
    }
    else {
        geschlossen.hidden = YES;
    }
    
    if(ess1Leer) {
        ess1Label.hidden = YES;
        Essen1.hidden = YES;
    }
    else {
        Essen1.text = essen.Essen1;
    }
    
    if(ess2Leer) {
        ess2Label.hidden = YES;
        Essen2.hidden = YES;
    }
    else {
        Essen2.text = essen.Essen2;
    }
    
    if(ess3Leer) {
        ess3Label.hidden = YES;
        Essen3.hidden = YES;
    }
    else {
        Essen3.text = essen.Essen3;
    }
    
    if(ess4Leer) {
        ess4Label.hidden = YES;
        Essen4.hidden = YES;
    }
    else {
        Essen4.text = essen.Essen4;
    }
    
    if(bioLeer) {
        bioLabel.hidden = YES;
        Bio.hidden = YES;
        
    }
    else {
        Bio.text = essen.Bio;
    }
    
    if(actLeer) {
        actLabel.hidden = YES;
        Aktionstag.hidden = YES;
    }
    else {
        Aktionstag.text = essen.Aktionstag;
    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
