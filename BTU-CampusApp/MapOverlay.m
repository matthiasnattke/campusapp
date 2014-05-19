//
//  MapOverlay.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "MapOverlay.h"


@implementation MapOverlay

// legt das Overlay als Rechteck an die GPS-Koordinaten des BTU-Campus

-(CLLocationCoordinate2D)coordinate {
    //Image center point
    return CLLocationCoordinate2DMake(51.760113, 14.324294);
}

- (MKMapRect)boundingMapRect
{
    //Latitue and longitude for each corner point
    MKMapPoint upperLeft   = MKMapPointForCoordinate(CLLocationCoordinate2DMake(51.770442, 14.316356));
    MKMapPoint upperRight  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(51.770442, 14.332233));
    MKMapPoint bottomLeft  = MKMapPointForCoordinate(CLLocationCoordinate2DMake(51.763556, 14.316356));
    
    //Building a map rect that represents the image projection on the map
    MKMapRect bounds = MKMapRectMake(upperLeft.x, upperLeft.y, fabs(upperLeft.x - upperRight.x), fabs(upperLeft.y - bottomLeft.y));

    return bounds;
}

-(void) dealloc {
  
}

@end
