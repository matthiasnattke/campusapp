//
//  FakViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "DbConnect.h"

@interface FakViewController : UITableViewController {
    NSMutableArray *auswahlListen;
    NSMutableArray *compListe;
    
    DbConnect *dbConnect;
}

@property(nonatomic, copy) NSMutableArray *auswahlListen;
@property(nonatomic, copy) NSMutableArray *compListe;

@property(nonatomic, strong) DbConnect *dbConnect;

@end
