//
//  NewsTableViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"


@interface NewsTableViewController : UITableViewController {
    NSMutableArray *newsListe;
    DbConnect * dbConnect;
}

@property (nonatomic, strong) NSMutableArray *newsListe;
@property (nonatomic, strong) DbConnect *dbConnect;


@end
