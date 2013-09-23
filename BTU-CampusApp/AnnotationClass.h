//
//  AnnotationClass.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


// Das ist die Gebäudeklasse.
// Objekte dieser Klasse werden der Karte hinzugefügt

@interface AnnotationClass : NSObject <MKAnnotation> {
	
	CLLocationCoordinate2D coordinate; // Koordinaten des Gebäude
	NSString *title; // Name wird auf der Karte angezeigt
	NSString *subtitle;
}

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;



@end