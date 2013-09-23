//
//  LehrstuhlViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "Learnhouse.h"
#import "DbConnect.h"

@interface LehrstuhlViewController : UIViewController {
    Learnhouse *lehrstuhl;
    
    IBOutlet UILabel *lsNameLabel;
    IBOutlet UILabel *lsFakLabel;
    IBOutlet UILabel *lsInstituteLabel;
    IBOutlet UILabel *lsFavLabel;
    IBOutlet UIButton *website;

    DbConnect *dbConnect;
    
    IBOutlet UIScrollView *scroll;
}

@property(nonatomic, retain) Learnhouse *lehrstuhl;
@property(nonatomic, retain)IBOutlet UILabel *lsNameLabel;
@property(nonatomic, retain)IBOutlet UILabel *lsFakLabel;
@property(nonatomic, retain)IBOutlet UILabel *lsFavLabel;
@property(nonatomic, retain)IBOutlet UILabel *lsInstituteLabel;
@property(nonatomic, retain)IBOutlet UIButton *website;
@property(nonatomic, strong) DbConnect *dbConnect;

@property (nonatomic, retain) IBOutlet UIScrollView *scroll;


-(IBAction)likeAndDelike;

@end
