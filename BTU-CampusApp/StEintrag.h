//
//  StEintrag.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface StEintrag : NSObject {
    NSString *name;
    NSString *vId;
    NSString *block;
    NSString *tag;
    NSString *dbTag;
    NSString *ort;
    
}

@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *vId;
@property(nonatomic, retain) NSString *block;
@property(nonatomic, retain) NSString *tag;
@property(nonatomic, retain) NSString *dbTag;
@property(nonatomic, retain) NSString *ort;

@end
