//
//  MensaViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "Essen.h"

@class  MensaTableViewController;

@interface MensaViewController : UIViewController {
    
    //IBOutlet UINavigationItem *OpeningTitle;
   	IBOutlet UILabel *Wochentag;
   	IBOutlet UILabel *Essen1;
   	IBOutlet UILabel *Essen2;
   	IBOutlet UILabel *Essen3;
    IBOutlet UILabel *Essen4;
   	IBOutlet UILabel *Bio;
    IBOutlet UILabel *Aktionstag;
    IBOutlet UILabel *geschlossen;
    IBOutlet UIScrollView *scroll;
    
    IBOutlet UILabel *ess1Label;
   	IBOutlet UILabel *ess2Label;
   	IBOutlet UILabel *ess3Label;
    IBOutlet UILabel *ess4Label;
    IBOutlet UILabel *bioLabel;
    IBOutlet UILabel *actLabel;
    Essen *essen;
    
}

@property (nonatomic, readwrite) IBOutlet UILabel *Wochentag;
@property (nonatomic, readwrite) IBOutlet UILabel *Essen1;
@property (nonatomic, retain) IBOutlet UILabel *Essen2;
@property (nonatomic, retain) IBOutlet UILabel *Essen3;
@property (nonatomic, retain) IBOutlet UILabel *Essen4;
@property (nonatomic, retain) IBOutlet UILabel *Bio;
@property (nonatomic, retain) IBOutlet UILabel *Aktionstag;
@property (nonatomic, retain) IBOutlet UILabel *geschlossen;
@property (nonatomic, retain) IBOutlet UIScrollView *scroll;

@property (nonatomic, retain)IBOutlet UILabel *ess1Label;
@property (nonatomic, retain)IBOutlet UILabel *ess2Label;
@property (nonatomic, retain)IBOutlet UILabel *ess3Label;
@property (nonatomic, retain)IBOutlet UILabel *ess4Label;
@property (nonatomic, retain) IBOutlet UILabel *bioLabel;
@property (nonatomic, retain)IBOutlet UILabel *actLabel;
@property (readwrite) Essen *essen;

@end
