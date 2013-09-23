//
//  StEintragViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "StEintragViewController.h"
#import "StEintrag.h"
#import "HAeditViewController.h"
#import "DbConnect.h"

@interface StEintragViewController ()

@end

@implementation StEintragViewController

@synthesize eintragListe, editController, zellenNr, dbConnect;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:NO];
    
    dbConnect = [[DbConnect alloc] init];
    
    [dbConnect openDb];
    
    // Listen mit Attributen
    NSMutableArray *nameStMon = [dbConnect getNameStMon];
    NSMutableArray *vIdStMon = [dbConnect getVIdStMon];
    NSMutableArray *blockStMon = [dbConnect getBlockStMon];
    NSMutableArray *nameStDie = [dbConnect getNameStDie];
    NSMutableArray *vIdStDie = [dbConnect getVIdStDie];
    NSMutableArray *blockStDie = [dbConnect getBlockStDie];
    NSMutableArray *nameStMitt = [dbConnect getNameStMitt];
    NSMutableArray *vIdStMitt = [dbConnect getVIdStMitt];
    NSMutableArray *blockStMitt = [dbConnect getBlockStMitt];
    NSMutableArray *nameStDon = [dbConnect getNameStDon];
    NSMutableArray *vIdStDon = [dbConnect getVIdStDon];
    NSMutableArray *blockStDon = [dbConnect getBlockStDon];
    NSMutableArray *nameStFrei = [dbConnect getNameStFrei];
    NSMutableArray *vIdStFrei = [dbConnect getVIdStFrei];
    NSMutableArray *blockStFrei = [dbConnect getBlockStFrei];
    
    [dbConnect closeDb];
    
    eintragListe = [[NSMutableArray alloc] init];
    
    // hier werden alle Einträge erstellt und in Listen gepackt
    //
    for(int i = 0; i < [nameStMon count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStMon objectAtIndex:i];
        eintrag.vId = [vIdStMon objectAtIndex:i];
        eintrag.block = [blockStMon objectAtIndex:i];
        eintrag.tag = @"Montag";
        if(![eintrag.vId isEqualToString:@""]) {
            [eintragListe addObject:eintrag];
        }
    }
    
    for(int i = 0; i < [nameStDie count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStDie objectAtIndex:i];
        eintrag.vId = [vIdStDie objectAtIndex:i];
        eintrag.block = [blockStDie objectAtIndex:i];
        eintrag.tag = @"Dienstag";
        if(![eintrag.vId isEqualToString:@""]) {
            [eintragListe addObject:eintrag];
        }
    }
    
    for(int i = 0; i < [nameStMitt count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStMitt objectAtIndex:i];
        eintrag.vId = [vIdStMitt objectAtIndex:i];
        eintrag.block = [blockStMitt objectAtIndex:i];
        eintrag.tag = @"Mittwoch";
        if(![eintrag.vId isEqualToString:@""]) {
            [eintragListe addObject:eintrag];
        }
    }
    
    for(int i = 0; i < [nameStDon count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStDon objectAtIndex:i];
        eintrag.vId = [vIdStDon objectAtIndex:i];
        eintrag.block = [blockStDon objectAtIndex:i];
        eintrag.tag = @"Donnerstag";
        if(![eintrag.vId isEqualToString:@""]) {
            [eintragListe addObject:eintrag];
        }
    }
    
    for(int i = 0; i < [nameStFrei count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStFrei objectAtIndex:i];
        eintrag.vId = [vIdStFrei objectAtIndex:i];
        eintrag.block = [blockStFrei objectAtIndex:i];
        eintrag.tag = @"Freitag";
        if(![eintrag.vId isEqualToString:@""]) {
            [eintragListe addObject:eintrag];
        }
    }
    
    // alle Listen vollständig gefüllt

}

// Verknüpft ausgewählte Veranstaltung mit der Hausaufgabe
- (IBAction)fertig:(id)sender {
    StEintrag *eintrag = [eintragListe objectAtIndex:zellenNr];
    editController.hausaufgabe.veranstaltung = eintrag.name;
    editController.hausaufgabe.veranstaltungID = eintrag.vId;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [eintragListe count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    StEintrag *eintrag = [eintragListe objectAtIndex:indexPath.row];
    cell.textLabel.text = eintrag.name;
    cell.detailTextLabel.text = eintrag.tag;
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    zellenNr = indexPath.row; // Zeilenzahl der ausgewählten Veranstaltung


}
/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"zurListe"])
    {
        NSLog(editController.veranstaltungLabel);
        editController =
        [segue sourceViewController];
    }


    
}*/

@end
