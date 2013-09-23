//
//  CampusMapViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "CampusMapViewController.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"

#define METERS_PER_MILE 1609.344

@implementation CampusMapViewController

@synthesize mapView, textField, building, dbConnect;

// Sucht ein Gebäude in der Datenbank

-(IBAction) search {
	[textField resignFirstResponder];
    
    // Übergabe des Sucheintrages, beinhaltet nur Kleinbuchstaben
    NSString *searchString = textField.text;
    NSString *searchStringLow = [searchString lowercaseString];
    
	// Überprüft ob eine Eingabe gemacht wurde
	// Es wird eine Fehlermeldung bei leerer Eingabe ausgegeben
	if ([textField.text isEqual:@""]) {
		UIAlertView *alert;
		alert = [[UIAlertView alloc] initWithTitle:@"Leere Eingabe!!" message:@"Bitte geben Sie etwas ein!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
        
	}// if
	
	else {
		
		// Datenbank wird geöffnet und Daten geladen
		[dbConnect openDb];
        NSMutableArray *idArray = [dbConnect getBuildingID:searchStringLow];
        NSMutableArray *titleArray = [dbConnect getBName];
		NSMutableArray *xArray = [dbConnect getBGPSX];
		NSMutableArray *yArray = [dbConnect getBGPSY];
        [dbConnect closeDb];
		
		if([idArray count] != 0) {
            
            //GebäudeID wird aus dem Array geholt in in ein NSInteger umgewandelt
            NSString *idString = [idArray objectAtIndex:0];
            NSInteger idB = [idString intValue];
            
            //entfernt Gebäude von der Karte
            [mapView removeAnnotation:building];
			
			// die String Objekte aus dem Array werden zwischengespeichert
			NSString *aTitle = [titleArray objectAtIndex:idB];
			NSString *gpsXString = [xArray objectAtIndex:idB];
			NSString *gpsYString = [yArray objectAtIndex:idB];
            
			//Die Koordianten werden in ein double konvertiert
			double gpsX = [gpsXString doubleValue];
			double gpsY = [gpsYString doubleValue];
            
			// Koordinaten werden erstellt
			CLLocationCoordinate2D searchCoord;
			searchCoord.longitude = gpsX;
			searchCoord.latitude = gpsY;
            
            
			// Gebäude erhält Titel und Koordinaten
			building.title = aTitle;
			building.coordinate = searchCoord;
            
			// fügt Gebäude der Karte hinzu
			[mapView addAnnotation:building];
            [mapView selectAnnotation:building animated:YES];
            
            // zentriere Map an gesuchter Stelle
            CLLocationCoordinate2D coord1 = {
                gpsY,gpsX
            };
            
            MKCoordinateSpan span = {.latitudeDelta = 0.002, .longitudeDelta = 0.002};
            MKCoordinateRegion region = {coord1, span};
            [mapView setRegion:region animated:YES];
            
			
		}// if
		
		else {
			UIAlertView *alert;
			alert = [[UIAlertView alloc] initWithTitle:@"Es gab keinen Treffer!!" message:@"Geben Sie ihre Eingabe erneut ein!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
		}// else
        
		
	}//else
	
}// search

// zeigt die eigene Position auf der Karte an
-(IBAction) position {
    [mapView setCenterCoordinate:mapView.userLocation.coordinate];
    MKCoordinateRegion region;
    region.center.latitude = mapView.userLocation.coordinate.latitude;
    region.center.longitude = mapView.userLocation.coordinate.longitude;
    region.span.latitudeDelta = 0.002;
    region.span.longitudeDelta = 0.002;
    region = [mapView regionThatFits:region];
    [mapView setRegion:region animated:TRUE];
	mapView.showsUserLocation = YES;

	
    
}// position

- (void)viewDidLoad
{    

    // Ein Gebäudeobjekt wird erstellt
	building = [[AnnotationClass alloc] init];
	building.subtitle = @"Campusplan";
	
	dbConnect = [[DbConnect alloc] init];
    
    // GPS-Startpunkt der App auf dem Campus
    CLLocationCoordinate2D coord1 = {
		51.767447,14.325233
	};
    
	MKCoordinateSpan span = {.latitudeDelta = 0.002, .longitudeDelta = 0.002};
	MKCoordinateRegion region = {coord1, span};
	[mapView setRegion:region animated:YES];
    
    // Legt Overlay über die Karte
    MapOverlay * mapOverlay = [[MapOverlay alloc] init];
    [mapView addOverlay:mapOverlay];
    
    // Ein Gebäudeobjekt wird erstellt
	building = [[AnnotationClass alloc] init];
	building.subtitle = @"Campusplan";
    
    // Schließe Datenbank nach Abrufen
	dbConnect = [[DbConnect alloc] init];
    
    [super viewDidLoad];
    
}



- (void)viewDidUnload
{
    self.mapView = nil;
    [super viewDidUnload];
}

-(void)dealloc {
    self.mapView = nil;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (textField) {
        if ([textField canResignFirstResponder]) [textField resignFirstResponder];
    }
    [super touchesBegan: touches withEvent:event];
}

//delegate fired bby mapview requesting a MKOverlayView for each MapOverlay added
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    
    MapOverlay *mapOverlay = (MapOverlay *)overlay;
    MapOverlayView *mapOverlayView = [[MapOverlayView alloc] initWithOverlay:mapOverlay];
    
    return mapOverlayView;
}

@end

