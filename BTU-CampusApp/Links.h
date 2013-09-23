//
//  Links.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface Links : NSObject {
    NSString *title_de;
    NSString *title_en;
    NSString *url_de;
    NSString *url_en;
}

@property (nonatomic, retain) NSString *title_de;
@property (nonatomic, retain) NSString *title_en;
@property (nonatomic, retain) NSString *url_de;
@property (nonatomic, retain) NSString *url_en;

@end
