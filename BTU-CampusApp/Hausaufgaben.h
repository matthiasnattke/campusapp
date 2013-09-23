//
//  Hausaufgaben.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface Hausaufgaben : NSObject {
    NSString *aufgabe;
    NSString *beschreibung;
    NSString *datum;
    NSString *priority;
    NSString *ID;
    NSString *veranstaltung;
    NSString *veranstaltungID;
}

@property(nonatomic, retain)NSString *aufgabe;
@property(nonatomic, retain)NSString *beschreibung;
@property(nonatomic, retain)NSString *datum;
@property(nonatomic, retain)NSString *priority;
@property(nonatomic, retain)NSString  *ID;
@property(nonatomic, retain) NSString *veranstaltung;
@property(nonatomic, retain) NSString *veranstaltungID;

@end

