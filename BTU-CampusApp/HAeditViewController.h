//
//  HAeditViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "Hausaufgaben.h"
#import "DbConnect.h"

@interface HAeditViewController : UIViewController {
    Hausaufgaben *hausaufgabe;
    IBOutlet UILabel *veranstaltungLabel;
    IBOutlet UITextField *aufgabeField;
    IBOutlet UITextField *datumField;
    IBOutlet UITextField *beschreibungField;
    IBOutlet UISegmentedControl *prioSeg;
    
    BOOL isEdit;
    IBOutlet UIButton *deleteButton;
    
    DbConnect *dbConnect;
    
}

@property (readwrite) Hausaufgaben *hausaufgabe;
@property(nonatomic, retain) IBOutlet UILabel *veranstaltungLabel;
@property(nonatomic, retain) IBOutlet UITextField *aufgabeField;
@property(nonatomic, retain) IBOutlet UITextField *datumField;
@property(nonatomic, retain) IBOutlet UITextField *beschreibungField;
@property(nonatomic, retain) IBOutlet UISegmentedControl *prioSeg;
@property(nonatomic, retain) IBOutlet UIButton *deleteButton;
@property(readwrite) BOOL isEdit;
@property(readwrite) BOOL isSaved;


@property(nonatomic, strong) DbConnect *dbConnect;


-(IBAction)speichern;
-(IBAction)loeschen;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)prioChanged;

@end
