//
//  Semester.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface Semester : NSObject {
    
NSString *name;
NSString *parameter;

}

@property(nonatomic, retain) NSString *name;
@property(readwrite) NSString *parameter;

@end

