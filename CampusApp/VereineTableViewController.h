//
//  VereineTableViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"

@interface VereineTableViewController : UITableViewController {
    NSMutableArray *vereineListe;
    DbConnect * dbConnect;
}

@property (nonatomic, strong) NSMutableArray *vereineListe;
@property (nonatomic, strong) DbConnect *dbConnect;

@end
