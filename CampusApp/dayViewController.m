//
//  dayViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "dayViewController.h"
#import "DbConnect.h"
#import "StEintrag.h"
#import "blockViewController.h"

@interface dayViewController ()

@end

@implementation dayViewController

@synthesize dayArray, completeArray, dbConnect;

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
    
    // Liste mit allen Wochentagen erstellen
    dayArray = [[NSMutableArray alloc] init];
    [dayArray addObject:@"Montag"];
    [dayArray addObject:@"Dienstag"];
    [dayArray addObject:@"Mittwoch"];
    [dayArray addObject:@"Donnerstag"];
    [dayArray addObject:@"Freitag"];
    
    completeArray = [[NSMutableArray alloc] init];
    
    // Listen mit Eintragobjekten
    NSMutableArray *montagListe = [[NSMutableArray alloc] init];
    NSMutableArray *dienstagListe = [[NSMutableArray alloc] init];
    NSMutableArray *mittwochListe = [[NSMutableArray alloc] init];
    NSMutableArray *donnerstagListe = [[NSMutableArray alloc] init];
    NSMutableArray *freitagListe = [[NSMutableArray alloc] init];
    
    dbConnect = [[DbConnect alloc] init];
    
    [dbConnect openDb];
    
    // Listen mit Attributen
    NSMutableArray *nameStMon = [dbConnect getNameStMon];
    NSMutableArray *vIdStMon = [dbConnect getVIdStMon];
    NSMutableArray *blockStMon = [dbConnect getBlockStMon];
    NSMutableArray *ortStMon = [dbConnect getOrtStMon];
    NSMutableArray *nameStDie = [dbConnect getNameStDie];
    NSMutableArray *vIdStDie = [dbConnect getVIdStDie];
    NSMutableArray *blockStDie = [dbConnect getBlockStDie];
    NSMutableArray *ortStDie = [dbConnect getOrtStDie];
    NSMutableArray *nameStMitt = [dbConnect getNameStMitt];
    NSMutableArray *vIdStMitt = [dbConnect getVIdStMitt];
    NSMutableArray *blockStMitt = [dbConnect getBlockStMitt];
    NSMutableArray *ortStMitt = [dbConnect getOrtStMitt];
    NSMutableArray *nameStDon = [dbConnect getNameStDon];
    NSMutableArray *vIdStDon = [dbConnect getVIdStDon];
    NSMutableArray *blockStDon = [dbConnect getBlockStDon];
    NSMutableArray *ortStDon = [dbConnect getOrtStDon];
    NSMutableArray *nameStFrei = [dbConnect getNameStFrei];
    NSMutableArray *vIdStFrei = [dbConnect getVIdStFrei];
    NSMutableArray *blockStFrei = [dbConnect getBlockStFrei];
    NSMutableArray *ortStFrei = [dbConnect getOrtStFrei];
    
    
    [dbConnect closeDb];
    
    // hier werden alle Einträge erstellt und in Listen gepackt
    for(int i = 0; i < [nameStMon count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStMon objectAtIndex:i];
        eintrag.tag = @"Montag";
        eintrag.dbTag = @"STMontag";
        eintrag.vId = [vIdStMon objectAtIndex:i];
        eintrag.block = [blockStMon objectAtIndex:i];
        eintrag.ort = [ortStMon objectAtIndex:i];
        [montagListe addObject:eintrag];
    }
    [completeArray addObject:montagListe];
    
    for(int i = 0; i < [nameStDie count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStDie objectAtIndex:i];
        eintrag.tag = @"Dienstag";
        eintrag.dbTag = @"STDienstag";
        eintrag.vId = [vIdStDie objectAtIndex:i];
        eintrag.block = [blockStDie objectAtIndex:i];
        eintrag.ort = [ortStDie objectAtIndex:i];
        [dienstagListe addObject:eintrag];
    }
    [completeArray addObject:dienstagListe];
    
    for(int i = 0; i < [nameStMitt count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStMitt objectAtIndex:i];
        eintrag.tag = @"Mittwoch";
        eintrag.dbTag = @"STMittwoch";
        eintrag.vId = [vIdStMitt objectAtIndex:i];
        eintrag.block = [blockStMitt objectAtIndex:i];
        eintrag.ort = [ortStMitt objectAtIndex:i];
        [mittwochListe addObject:eintrag];
    }
    [completeArray addObject:mittwochListe];
    
    for(int i = 0; i < [nameStDon count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStDon objectAtIndex:i];
        eintrag.tag = @"Donnerstag";
        eintrag.dbTag = @"STDonnerstag";
        eintrag.vId = [vIdStDon objectAtIndex:i];
        eintrag.block = [blockStDon objectAtIndex:i];
        eintrag.ort = [ortStDon objectAtIndex:i];
        [donnerstagListe addObject:eintrag];
    }
    [completeArray addObject:donnerstagListe];
    
    for(int i = 0; i < [nameStFrei count]; i++) {
        StEintrag *eintrag = [[StEintrag alloc] init];
        eintrag.name = [nameStFrei objectAtIndex:i];
        eintrag.tag = @"Freitag";
        eintrag.dbTag = @"STFreitag";
        eintrag.vId = [vIdStFrei objectAtIndex:i];
        eintrag.block = [blockStFrei objectAtIndex:i];
        eintrag.ort = [ortStFrei objectAtIndex:i];
        [freitagListe addObject:eintrag];
    }
    [completeArray addObject:freitagListe];
    
    [self.tableView reloadData];
    
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
    return [dayArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [dayArray objectAtIndex:indexPath.row];
    
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"block"]) {
        blockViewController *blockView = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
        blockView.blockArray = [completeArray objectAtIndex:myIndexPath.row];
        blockView.navigationItem.title = [dayArray objectAtIndex:myIndexPath.row];
        
    }
}

@end
