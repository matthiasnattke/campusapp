//
//  OpeningHours.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface OpeningHours : NSObject {
    
    NSString *Title;
    NSString *Montag;
    NSString *Dienstag;
    NSString *Mittwoch;
    NSString *Donnerstag;
    NSString *Freitag;
    NSString *Samstag;
    NSString *Sonntag;
    NSString *Ort;
}

@property (nonatomic, retain) NSString *Title;
@property (nonatomic, retain) NSString *Montag;
@property (nonatomic, retain) NSString *Dienstag;
@property (nonatomic, retain) NSString *Mittwoch;
@property (nonatomic, retain) NSString *Donnerstag;
@property (nonatomic, retain) NSString *Freitag;
@property (nonatomic, retain) NSString *Samstag;
@property (nonatomic, retain) NSString *Sonntag;
@property (nonatomic, retain) NSString *Ort;

@end