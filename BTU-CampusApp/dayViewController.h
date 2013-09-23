//
//  dayViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"

@interface dayViewController : UITableViewController {
    NSMutableArray *dayArray;
    NSMutableArray *completeArray;
    DbConnect *dbConnect;
}

@property(nonatomic, retain) NSMutableArray *dayArray;
@property(nonatomic, retain) NSMutableArray *completeArray;
@property(nonatomic, strong) DbConnect *dbConnect;

@end
