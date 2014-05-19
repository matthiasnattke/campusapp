//
//  OpeningHoursTableViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "OpeningHoursTableViewController.h"
#import "DbConnect.h"
#import "OpeningHours.h"
#import "OpeningHoursViewController.h"



@interface OpeningHoursTableViewController ()

@property (nonatomic, strong) NSMutableArray *OpeningHoursArray;
@property (nonatomic, strong) DbConnect *dbConnect;


@end

@implementation OpeningHoursTableViewController
@synthesize OpeningHoursArray, dbConnect;



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
    NSMutableArray *OpeningTitleItemArray;
    NSMutableArray *OpeningItemMondayArray;
    NSMutableArray *OpeningItemTuesdayArray;
    NSMutableArray *OpeningItemWednesdayArray;
    NSMutableArray *OpeningItemThursdayArray;
    NSMutableArray *OpeningItemFridayArray;
    NSMutableArray *OpeningItemSaturdayArray;
    NSMutableArray *OpeningItemSundayArray;
    NSMutableArray *OpeningItemLocationBuildingArray;
    NSMutableArray *OpeningItemLocationRoomArray;
    
    // Datenbank wird geöffnet und Daten herausgeholt
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    OpeningTitleItemArray = [dbConnect getOpeningTitles];
    OpeningItemMondayArray = [dbConnect getOpeningMonday];
    OpeningItemTuesdayArray = [dbConnect getOpeningTuesday];
    OpeningItemWednesdayArray = [dbConnect getOpeningWednesday];
    OpeningItemThursdayArray = [dbConnect getOpeningThursday];
    OpeningItemFridayArray = [dbConnect getOpeningFriday];
    OpeningItemSaturdayArray = [dbConnect getOpeningSaturday];
    OpeningItemSundayArray = [dbConnect getOpeningSunday];
    OpeningItemLocationBuildingArray = [dbConnect getOpeningLocationBuilding];
    OpeningItemLocationRoomArray = [dbConnect getOpeningLocationRoom];
    [dbConnect closeDb];
    
    OpeningHoursArray = [[NSMutableArray alloc] init];
    for (int i=0; i<[OpeningTitleItemArray count]; i++) {
        OpeningHours *oh = [[OpeningHours alloc] init];
        oh.Title = [OpeningTitleItemArray objectAtIndex:i];
        oh.Montag = [OpeningItemMondayArray objectAtIndex:i];
        oh.Dienstag = [OpeningItemTuesdayArray objectAtIndex:i];
        oh.Mittwoch = [OpeningItemWednesdayArray objectAtIndex:i];
        oh.Donnerstag = [OpeningItemThursdayArray objectAtIndex:i];
        oh.Freitag = [OpeningItemFridayArray objectAtIndex:i];
        oh.Samstag = [OpeningItemSaturdayArray objectAtIndex:i];
        oh.Sonntag = [OpeningItemSundayArray objectAtIndex:i];
        NSString *ortB = [OpeningItemLocationBuildingArray objectAtIndex:i];
        NSString *ortR =[OpeningItemLocationRoomArray objectAtIndex:i];
        oh.Ort = [NSString stringWithFormat:@"%@ %@", ortB, ortR];
        
        [OpeningHoursArray addObject:oh];
        
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = YES;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [OpeningHoursArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OpeningCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    OpeningHours *oh = [[OpeningHours alloc] init];
    oh = [OpeningHoursArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = oh.Title;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"OpeningHoursViewController"])
    {
        OpeningHoursViewController *detailViewController =
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
        OpeningHours *openingHour = [[OpeningHours alloc] init];
        openingHour = [OpeningHoursArray objectAtIndex:myIndexPath.row];
        detailViewController.openingHour = openingHour;
    }
}


@end
