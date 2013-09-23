//
//  haViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "StEintrag.h"
#import "DbConnect.h"


@interface haViewController : UIViewController {
    StEintrag *eintrag;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *blockLabel;
    IBOutlet UILabel *vIDLabel;
    DbConnect *dbConnect;
    NSMutableArray *hausaufgabenArray;
    IBOutlet UIButton *deleteButton;
    IBOutlet UIButton *anzeigenButton;
    IBOutlet UIButton *hinzuButton;
    IBOutlet UIButton *erstellenButton;
    IBOutlet UIButton *bearbeitenButton;
}

@property(nonatomic, retain) StEintrag *eintrag;
@property(nonatomic, retain) IBOutlet UILabel *nameLabel;
@property(nonatomic, retain) IBOutlet UILabel *blockLabel;
@property(nonatomic, retain) IBOutlet UILabel *vIDLabel;
@property(nonatomic, strong) DbConnect *dbConnect;
@property(nonatomic, retain) NSMutableArray *hausaufgabenArray;
@property(nonatomic, retain) IBOutlet UIButton *deleteButton;
@property(nonatomic, retain) IBOutlet UIButton *anzeigenButton;
@property(nonatomic, retain) IBOutlet UIButton *hinzuButton;
@property(nonatomic, retain) IBOutlet UIButton *erstellenButton;
@property(nonatomic, retain) IBOutlet UIButton *bearbeitenButton;

-(IBAction)delete;

@end
