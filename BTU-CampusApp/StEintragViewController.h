//
//  StEintragViewController.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <UIKit/UIKit.h>
#import "HAeditViewController.h"
#import "DbConnect.h"

@interface StEintragViewController : UITableViewController {
    NSMutableArray *eintragListe;
    HAeditViewController *editController;
    int zellenNr;
    DbConnect *dbConnect;
}

@property(nonatomic, retain) NSMutableArray *eintragListe;
@property(nonatomic, retain) HAeditViewController *editController;
@property(nonatomic, readwrite) int zellenNr;
@property (nonatomic, strong) DbConnect *dbConnect;

- (IBAction)fertig:(id)sender;


@end
