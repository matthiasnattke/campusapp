//
//  Lehrveranstaltung.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface Lehrveranstaltung : NSObject {
    NSString *semester;
    NSString *veranstaltungsnummer;
    NSString *titel;
    NSString *art;
    NSString *sws;
}

@property(nonatomic, retain) NSString *semester;
@property(nonatomic, retain) NSString *veranstaltungsnummer;
@property(nonatomic, retain) NSString *titel;
@property(nonatomic, retain) NSString *art;
@property(nonatomic, retain) NSString *sws;
@end
