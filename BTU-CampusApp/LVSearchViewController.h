//
//  LVSearchViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"
#import "Abschluss.h"
#import "Semester.h"
#import "Studiengang.h"

@interface LVSearchViewController : UIViewController {
    
    DbConnect *dbConnect;
    IBOutlet UITextField *name;
    IBOutlet UISlider *abschlussSlider;
    IBOutlet UILabel *abschlussLabel;
    IBOutlet UISlider *semesterSlider;
    IBOutlet UILabel *semesterLabel;
    IBOutlet UISlider *studiengangSlider;
    IBOutlet UILabel *studiengangLabel;
    NSMutableArray *abschlussListe;
    NSMutableArray *semesterListe;
    NSMutableArray *studiengangListe;
    IBOutlet UISlider *vonSlider;
    IBOutlet UISlider *bisSlider;
    IBOutlet UILabel *vonLabel;
    IBOutlet UILabel *bisLabel;
    Abschluss *abschluss;
    Semester *semester;
    Studiengang *studiengang;
    NSString *von;
    NSString *bis;
    NSString *urlWithParameter;
    
    
}

@property(nonatomic, strong) DbConnect *dbConnect;
@property (nonatomic, retain) UITextField *name;
@property (nonatomic, retain) UISlider *abschlussSlider;
@property (nonatomic, retain) UILabel *abschlussLabel;
@property (nonatomic, retain) UISlider *semesterSlider;
@property (nonatomic, retain) UILabel *semesterLabel;
@property (nonatomic, retain) UISlider *studiengangSlider;
@property (nonatomic, retain) UILabel *studiengangLabel;
@property (nonatomic, strong) NSMutableArray *abschlussListe;
@property (nonatomic, strong) NSMutableArray *semesterListe;
@property (nonatomic, strong) NSMutableArray *studiengangListe;
@property (nonatomic, retain) UISlider *vonSlider;
@property (nonatomic, retain) UISlider *bisSlider;
@property (nonatomic, retain) UILabel *vonLabel;
@property (nonatomic, retain) UILabel *bisLabel;
@property(nonatomic, strong) Abschluss *abschluss;
@property(nonatomic, strong) Semester *semester;
@property(nonatomic, strong) Studiengang *studiengang;
@property(nonatomic, retain) NSString *von;
@property(nonatomic, retain) NSString *bis;
@property(nonatomic, retain) NSString *urlWithParameter;


-(IBAction) search;
-(IBAction) sliderAbschlussChanged:(id)sender;
-(IBAction) sliderSemesterChanged:(id)sender;
-(IBAction) sliderStudiengangChanged:(id)sender;
-(IBAction) sliderVonChanged:(UISlider*)sender;
-(IBAction) sliderBisChanged:(UISlider*)sender;

@end
