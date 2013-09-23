//
//  ToDoListViewController.m
//  Hausaufgabenliste
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "ToDoListViewController.h"
#import "DbConnect.h"
#import"Hausaufgaben.h"
#import "HAeditViewController.h"

@interface ToDoListViewController ()


@end

@implementation ToDoListViewController
@synthesize hausaufgabenArray;
@synthesize dbConnect;


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
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:NO];
    
    dbConnect = [[DbConnect alloc] init];
    hausaufgabenArray = [[NSMutableArray alloc] init];
    
    
    // holt die Hausaufgabendaten aus der Datenbank
    [dbConnect openDb];
    NSMutableArray *aufgabeArray = [dbConnect getHAufgabe];
    NSMutableArray *beschreibungArray = [dbConnect getHBeschreibung];
    NSMutableArray *datumArray = [dbConnect getHDatum];
    NSMutableArray *priorityArray = [dbConnect getHPriority];
    NSMutableArray *idArray = [dbConnect getHID];
    NSMutableArray *veranstaltungArray = [dbConnect getHVeranst];
    NSMutableArray *veranstIDArray = [dbConnect getHVID];
    [dbConnect closeDb];
    
    // hier werden die Hausaufgaben erstellt
    // und in die Hausaufgabenliste gepackt
    //
    for(int i = 0; i < [veranstaltungArray count]; i++) {
        Hausaufgaben *hausaufgabe = [[Hausaufgaben alloc] init];
        hausaufgabe.aufgabe = [aufgabeArray objectAtIndex:i];
        hausaufgabe.beschreibung = [beschreibungArray objectAtIndex:i];
        hausaufgabe.datum = [datumArray objectAtIndex:i];
        hausaufgabe.priority = [priorityArray objectAtIndex:i];
        hausaufgabe.ID = [idArray objectAtIndex:i];
        hausaufgabe.veranstaltung = [veranstaltungArray objectAtIndex:i];
        hausaufgabe.veranstaltungID = [veranstIDArray objectAtIndex:i];
        [hausaufgabenArray addObject:hausaufgabe];
    }
    
    // aktualisert den View
    [self.tableView reloadData];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    return [hausaufgabenArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ToDoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    Hausaufgaben *hausaufgabe = [hausaufgabenArray objectAtIndex:indexPath.row];
    
    
    // Prioritätzahl wird Adjektiv
    NSString *prString;
    if([hausaufgabe.priority isEqualToString:@"0"]) {
        prString = @"hoch";
    }
    if([hausaufgabe.priority isEqualToString:@"1"]) {
        prString = @"mittel";
    }
    if([hausaufgabe.priority isEqualToString:@"2"]) {
        prString = @"gering";
    }
    
    cell.textLabel.text = hausaufgabe.aufgabe;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ Priorität: %@", hausaufgabe.datum, prString];
    
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

// hier wird die Hausaufgabe übergeben zum:
// Hinzufügen bzw.
// zum Editieren
//
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // hier wird die Hausaufgabe zum Bearbeiten überreicht
    if ([[segue identifier] isEqualToString:@"edit"])
    {
        HAeditViewController *editController =
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
        Hausaufgaben *hausaufgabe = [hausaufgabenArray objectAtIndex:myIndexPath.row];
        editController.hausaufgabe  = hausaufgabe;
        editController.isEdit = YES;
        editController.navigationItem.title = @"Bearbeiten";
    }
    
    // hier wird ein Protoypobjekt vom Typ Hausaufgaben zum Hinzufügen überreicht
    if ([[segue identifier] isEqualToString:@"hinzu"])
    {
        HAeditViewController *hinzuController =
        [segue destinationViewController];
        
        Hausaufgaben *hausaufgabe = [[Hausaufgaben alloc] init];
        hausaufgabe.priority = @"1";
        hinzuController.hausaufgabe  = hausaufgabe;
        hinzuController.isEdit = NO;
        hinzuController.navigationItem.title = @"Hinzufügen";
    }

}

@end
