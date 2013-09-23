//
//  EventsTableViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"

@interface EventsTableViewController : UITableViewController {
    NSMutableArray *eventListe;
    DbConnect * dbConnect;
}

@property (nonatomic, strong) NSMutableArray *eventListe;
@property (nonatomic, strong) DbConnect *dbConnect;


@end
