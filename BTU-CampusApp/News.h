//
//  News.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface News : NSObject {
    
    NSString *title;
    NSString *link;
    NSString *description;
    NSString *pubDate;
    NSString *guid;
    
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *pubDate;
@property (nonatomic, retain) NSString *guid;



@end



