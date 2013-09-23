//
//  ToDoListViewController.h
//  Hausaufgabenliste
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"

@interface ToDoListViewController : UITableViewController {
    NSMutableArray *hausaufgabenArray;
}

@property (nonatomic, retain) NSMutableArray *hausaufgabenArray;
@property (nonatomic, strong) DbConnect *dbConnect;

@end
