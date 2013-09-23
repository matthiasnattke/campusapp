//
//  NewsTableViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "NewsTableViewController.h"
#import "DbConnect.h"
#import "News.h"
#import "WebViewViewController.h"


@interface NewsTableViewController ()

@end

@implementation NewsTableViewController

@synthesize newsListe, dbConnect;


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
    titleArray = [dbConnect getNewstitle];
    dateArray = [dbConnect getNewsdate];
    urlArray = [dbConnect getNewsurl];
    [dbConnect closeDb];
    
    
    newsListe = [[NSMutableArray alloc] init];
    for (int i=0; i<[titleArray count]; i++) {
        News *news = [[News alloc] init];
        news.title = [titleArray objectAtIndex:i];
        news.pubDate = [dateArray objectAtIndex:i];
        news.link = [urlArray objectAtIndex:i];
        
        [newsListe addObject:news];
        
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
    titleArray = [dbConnect getNewstitle];
    dateArray = [dbConnect getNewsdate];
    urlArray = [dbConnect getNewsurl];
    [dbConnect closeDb];
    
    
    newsListe = [[NSMutableArray alloc] init];
    for (int i=0; i<[titleArray count]; i++) {
        News *news = [[News alloc] init];
        news.title = [titleArray objectAtIndex:i];
        news.pubDate = [dateArray objectAtIndex:i];
        news.link = [urlArray objectAtIndex:i];
        //NSLog(@"Tag: %@", news.title);
        
        [newsListe addObject:news];
        
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
    return [newsListe count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NewsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    News *news = [[News alloc] init];
    news = [newsListe objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
    [dateFormatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss z"];
    //NSDate *date = [dateFormatter dateFromString:@"Tue, 30 Jan 2013 12:00:00 +0100"];
    NSDate *date = [dateFormatter dateFromString:news.pubDate];
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    
    cell.textLabel.text = news.title;
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
        
        News *news = [[News alloc] init];
        news = [newsListe objectAtIndex:myIndexPath.row];
        website.websiteName = news.link;
        
        
        
    }
    
}


@end
