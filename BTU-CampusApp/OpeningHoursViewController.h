//
//  OpeningHoursViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "OpeningHours.h"
@class OpeningHoursTableViewController;

@interface OpeningHoursViewController : UIViewController {
    
   	IBOutlet UINavigationItem *OpeningTitle;
   	IBOutlet UILabel *Montag;
   	IBOutlet UILabel *Dienstag;
   	IBOutlet UILabel *Mittwoch;
   	IBOutlet UILabel *Donnerstag;
    IBOutlet UILabel *Freitag;
   	IBOutlet UILabel *Samstag;
    IBOutlet UILabel *Sonntag;
   	IBOutlet UILabel *Ort;
    IBOutlet UIScrollView *scroll;
    OpeningHours *openingHour;
}

@property (nonatomic, readwrite) IBOutlet UINavigationItem *OpeningTitle;
@property (nonatomic, readwrite) IBOutlet UILabel *Montag;
@property (nonatomic, readwrite) IBOutlet UILabel *Dienstag;
@property (nonatomic, retain) IBOutlet UILabel *Mittwoch;
@property (nonatomic, retain) IBOutlet UILabel *Donnerstag;
@property (nonatomic, retain) IBOutlet UILabel *Freitag;
@property (nonatomic, retain) IBOutlet UILabel *Samstag;
@property (nonatomic, retain) IBOutlet UILabel *Sonntag;
@property (nonatomic, retain) IBOutlet UILabel *Ort;
@property (nonatomic, retain) IBOutlet UIScrollView *scroll;
@property (readwrite) OpeningHours *openingHour;


@end
