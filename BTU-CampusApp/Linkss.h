//
//  Linkss.h
//  BTU-CampusApp
//
//  Created by Matthias on 03.03.13.
//  Copyright (c) 2013 JMMMT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface item : NSObject {
    
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