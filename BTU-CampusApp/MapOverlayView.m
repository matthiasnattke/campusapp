//
//  MapOverlayView.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "MapOverlayView.h"
#import "MapOverlay.h"

@implementation MapOverlayView

// erstellt das Mapoverlay aus der Datei

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)ctx
{
    
    UIImage *image          = [UIImage imageNamed:@"campusplan_2D.jpg"];
    CGImageRef imageReference = image.CGImage;
    
    //Loading and setting the image
    MKMapRect theMapRect    = [self.overlay boundingMapRect];
    CGRect theRect           = [self rectForMapRect:theMapRect];

    
    // We need to flip and reposition the image here
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextTranslateCTM(ctx, 0.0, -theRect.size.height);
    CGContextSetAlpha(ctx, 1.0);
    
    //drawing the image to the context
    CGContextDrawImage(ctx, theRect, imageReference);

}


@end
