//
//  CampusMapViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AnnotationClass.h"
#import "DbConnect.h"

@interface CampusMapViewController : UIViewController {
    
    IBOutlet UITextField *textField;
    AnnotationClass *building;
    DbConnect *dbConnect;
}

@property (nonatomic, assign) IBOutlet MKMapView * mapView;

-(IBAction) search;
-(IBAction) position;

@property(nonatomic, retain) UITextField *textField;
@property(nonatomic, retain) AnnotationClass *building;
@property(nonatomic, strong) DbConnect *dbConnect;

@end