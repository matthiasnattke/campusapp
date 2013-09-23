//
//  MensaUpdateViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "Essen.h"
#import "DbConnect.h"

@interface MensaUpdateViewController : UIViewController {
    //Activity Indicator
    IBOutlet UIActivityIndicatorView *XMLactivity;
    DbConnect *dbConnect;
    NSMutableArray *essenListe;
}



@property (nonatomic, strong) DbConnect *dbConnect;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *XMLactivity;
@property (nonatomic, retain) NSMutableArray *essenListe;

-(IBAction)update;

@end

