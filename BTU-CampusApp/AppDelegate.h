//
//  AppDelegate.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "Essen.h"
#import "Links.h"
#import "Events.h"
#import "DbConnect.h"
#import "Linkss.h"

@class Reachability;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    DbConnect *dbConnect;
    NSMutableArray *essenListe;
    NSMutableArray *linkListe;
    NSMutableArray *eventListe;
    NSMutableArray *newsListe;
}


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DbConnect *dbConnect;
@property (nonatomic, retain) NSMutableArray *essenListe;
@property (nonatomic, retain) NSMutableArray *linkListe;
@property (nonatomic, retain) NSMutableArray *eventListe;
@property (nonatomic, retain) NSMutableArray *newsListe;





@end

