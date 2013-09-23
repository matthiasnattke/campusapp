//
//  Learnhouse.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface Learnhouse : NSObject {
    NSString *name;
    NSString *institude;
    NSString *url;
    NSString *fak;
    NSString *fakDB; //Betitelung in der Datenbank
    BOOL fav;
}

@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *institute;
@property(nonatomic, retain)NSString *url;
@property(nonatomic, retain)NSString *fak;
@property(nonatomic, retain)NSString *fakDB;

@property(nonatomic)BOOL fav;

@end
