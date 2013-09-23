//
//  Fachschaften.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface Fachschaften : NSObject {
    NSString *faculty;
    NSString *name;
    NSString *url;
    NSString *email;
}

@property (nonatomic, retain) NSString *faculty;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *email;

@end