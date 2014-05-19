//
//  LinksViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"

@interface LinksViewController : UITableViewController {
    NSMutableArray *linkListe;
    DbConnect *dbConnect;
}

@property (nonatomic, strong) NSMutableArray *linkListe;
@property (nonatomic, strong) DbConnect *dbConnect;

@end
