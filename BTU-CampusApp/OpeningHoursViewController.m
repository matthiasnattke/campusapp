//
//  OpeningHoursViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "OpeningHoursViewController.h"
#import "DbConnect.h"
#import "OpeningHours.h"



@interface OpeningHoursViewController ()


@end

@implementation OpeningHoursViewController


@synthesize openingHour;

// Labels

@synthesize OpeningTitle;
@synthesize Montag;
@synthesize Dienstag;
@synthesize Mittwoch;
@synthesize Donnerstag;
@synthesize Freitag;
@synthesize Samstag;
@synthesize Sonntag;
@synthesize Ort;
@synthesize scroll;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Prüfe die Wochentage, ob geschlossen oder zeige Öffnungszeit an.
    
    [scroll setScrollEnabled:YES];
    if([openingHour.Montag isEqualToString:@""]) {
        Montag.text = @"geschlossen";
    }
    else {
        Montag.text = openingHour.Montag;
    }
    if([openingHour.Dienstag isEqualToString:@""]) {
        Dienstag.text = @"geschlossen";
    }
    else {
        Dienstag.text = openingHour.Dienstag;
    }
    if([openingHour.Mittwoch isEqualToString:@""]) {
        Mittwoch.text = @"geschlossen";
    }
    else {
        Mittwoch.text = openingHour.Mittwoch;
    }
    if([openingHour.Donnerstag isEqualToString:@""]) {
        Donnerstag.text = @"geschlossen";
    }
    else {
        Donnerstag.text = openingHour.Donnerstag;
    }
    if([openingHour.Freitag isEqualToString:@""]) {
        Freitag.text = @"geschlossen";
    }
    else {
        Freitag.text = openingHour.Freitag;
    }
    if([openingHour.Samstag isEqualToString:@""]) {
        Samstag.text = @"geschlossen";
    }
    else {
        Samstag.text = openingHour.Samstag;
    }
    
    if([openingHour.Sonntag isEqualToString:@""]) {
        Sonntag.text = @"geschlossen";
    }
    else {
        Sonntag.text = openingHour.Sonntag;
    }
    
    
    Ort.text = openingHour.Ort;
    OpeningTitle.title = openingHour.Title;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
