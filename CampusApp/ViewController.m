//
//  ViewController.m
//  MapOverlay
//
//  Created by Raphael Petegrosso on 5/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"

@implementation ViewController

@synthesize mapView = _mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Centering map
    CLLocationCoordinate2D coord1 = {
		51.767447,14.325233
	};
	
	MKCoordinateSpan span = {.latitudeDelta = 0.002, .longitudeDelta = 0.002};
	MKCoordinateRegion region = {coord1, span};
	[_mapView setRegion:region animated:YES];
    
    //Adding our overlay to the map
    MapOverlay * mapOverlay = [[MapOverlay alloc] init];
    [_mapView addOverlay:mapOverlay];
    
}


- (void)viewDidUnload
{    
    self.mapView = nil;
    [super viewDidUnload];
}

-(void)dealloc {
    self.mapView = nil;
}

//delegate fired bby mapview requesting a MKOverlayView for each MapOverlay added
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {

    MapOverlay *mapOverlay = (MapOverlay *)overlay;    
    MapOverlayView *mapOverlayView = [[MapOverlayView alloc] initWithOverlay:mapOverlay];
    
    return mapOverlayView;
}

@end
