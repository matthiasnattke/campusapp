//
//  EventsTableViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "EventsTableViewController.h"
#import "DbConnect.h"
#import "Events.h"
#import "WebViewViewController.h"


@interface EventsTableViewController ()

@end

@implementation EventsTableViewController

@synthesize eventListe, dbConnect;


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
    
    // Arraysdeklaration der Zwischenspeicher
    NSMutableArray *titleArray;
    NSMutableArray *dateArray;
    NSMutableArray *urlArray;
    
    // Datenbank wird geöffnet und Daten herausgeholt
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    titleArray = [dbConnect getEventstitle];
    dateArray = [dbConnect getEventsdate];
    urlArray = [dbConnect getEventsurl];
    [dbConnect closeDb];
    
    
    eventListe = [[NSMutableArray alloc] init];
    for (int i=0; i<[titleArray count]; i++) {
        Events *event = [[Events alloc] init];
        event.title = [titleArray objectAtIndex:i];
        event.pubDate = [dateArray objectAtIndex:i];
        event.link = [urlArray objectAtIndex:i];
        
        [eventListe addObject:event];
        
        // Zählt Linkanzahl und gibt sie im Log aus
        // NSLog(@"%i", [linkListe count]);
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    // Arraysdeklaration der Zwischenspeicher
    NSMutableArray *titleArray;
    NSMutableArray *dateArray;
    NSMutableArray *urlArray;
    
    // Datenbank wird geöffnet und Daten herausgeholt
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    titleArray = [dbConnect getEventstitle];
    dateArray = [dbConnect getEventsdate];
    urlArray = [dbConnect getEventsurl];
    [dbConnect closeDb];
    
    
    eventListe = [[NSMutableArray alloc] init];
    for (int i=0; i<[titleArray count]; i++) {
        Events *event = [[Events alloc] init];
        event.title = [titleArray objectAtIndex:i];
        event.pubDate = [dateArray objectAtIndex:i];
        event.link = [urlArray objectAtIndex:i];
        NSLog(@"Tag: %@", event.title);
        
        [eventListe addObject:event];
        
        // Zählt Linkanzahl und gibt sie im Log aus
        // NSLog(@"%i", [linkListe count]);
    }
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
    return [eventListe count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Events *event = [[Events alloc] init];
    event = [eventListe objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
    [dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss z"];
    //NSDate *date = [dateFormatter dateFromString:@"Tue, 30 Jan 2013 12:00:00 +0100"];
    NSDate *date = [dateFormatter dateFromString:event.pubDate];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    cell.textLabel.text = event.title;
    cell.detailTextLabel.text = formattedDate;
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
        
        Events *event = [[Events alloc] init];
        event = [eventListe objectAtIndex:myIndexPath.row];
        website.websiteName = event.link;
        
        
        
    }
    
}


@end
