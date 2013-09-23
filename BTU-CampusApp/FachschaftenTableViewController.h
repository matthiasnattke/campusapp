//
//  FachschaftenTableViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"

@interface FachschaftenTableViewController : UITableViewController {
    NSMutableArray *fachschaftenListe;
    DbConnect * dbConnect;
}

@property (nonatomic, strong) NSMutableArray *fachschaftenListe;
@property (nonatomic, strong) DbConnect *dbConnect;
@end
