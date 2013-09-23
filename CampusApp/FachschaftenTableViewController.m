//
//  FachschaftenTableViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "FachschaftenTableViewController.h"
#import "DbConnect.h"
#import "Fachschaften.h"
#import "WebViewViewController.h"


@interface FachschaftenTableViewController ()

@end

@implementation FachschaftenTableViewController

@synthesize fachschaftenListe, dbConnect;

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
    
    //Arraydeklaration der Zwischenspeicher
    NSMutableArray *nameArray;
    NSMutableArray *urlArray;
    //NSMutableArray *emailArray;
    
    // Datenbank wird geöffnet und Daten herausgeholt
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    nameArray = [dbConnect getFachschaftenName];
    urlArray = [dbConnect getFachschaftenUrl];
    [dbConnect closeDb];
    
    fachschaftenListe = [[NSMutableArray alloc] init];
    for (int i=0; i<[nameArray count]; i++) {
        Fachschaften *fachschaften = [[Fachschaften alloc] init];
        fachschaften.name = [nameArray objectAtIndex:i];
        fachschaften.url = [urlArray objectAtIndex:i];
        
        [fachschaftenListe addObject:fachschaften];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [fachschaftenListe count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FachschaftenCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Fachschaften *fachschaften = [[Fachschaften alloc] init];
    fachschaften = [fachschaftenListe objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fachschaften.name;
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
    if ([[segue identifier] isEqualToString:@"ShowWebsite"]) {
        WebViewViewController *website = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
        Fachschaften *fachschaften = [[Fachschaften alloc] init];
        fachschaften = [fachschaftenListe objectAtIndex:myIndexPath.row];
        website.websiteName = fachschaften.url;
        
        
        
    }
    
}

@end
