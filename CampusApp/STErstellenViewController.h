//
//  STErstellenViewController.h
//  BTU-CampusApp
//
//  Created by Admin on 06.02.13.
//  Copyright (c) 2013 JMMMT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StEintrag.h"
#import "DbConnect.h"

@interface STErstellenViewController : UIViewController {
    StEintrag *eintrag;
    //IBOutlet UILabel *veranstaltungLabel;
    IBOutlet UITextField *aufgabeField;
    IBOutlet UITextField *datumField;
    //IBOutlet UITextField *beschreibungField;
    //IBOutlet UISegmentedControl *prioSeg;
    
    BOOL isEdit;
    IBOutlet UIButton *deleteButton;
    
    DbConnect *dbConnect;
    
}

@property (readwrite) StEintrag *eintrag;
//@property(nonatomic, retain) IBOutlet UILabel *veranstaltungLabel;
@property(nonatomic, retain) IBOutlet UITextField *aufgabeField;
@property(nonatomic, retain) IBOutlet UITextField *datumField;
//@property(nonatomic, retain) IBOutlet UITextField *beschreibungField;
//@property(nonatomic, retain) IBOutlet UISegmentedControl *prioSeg;
@property(nonatomic, retain) IBOutlet UIButton *deleteButton;
@property(readwrite) BOOL isEdit;


@property(nonatomic, strong) DbConnect *dbConnect;


-(IBAction)speichern;
-(IBAction)textFieldDoneEditing:(id)sender;

@end
