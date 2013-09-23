//
//  LinksViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "LinksViewController.h"
#import "DbConnect.h"
#import "Links.h"
#import "WebViewViewController.h"

@interface LinksViewController ()

@end

@implementation LinksViewController

@synthesize linkListe, dbConnect;

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
    NSMutableArray *title_deArray;
    NSMutableArray *url_deArray;
    
    // Datenbank wird geöffnet und Daten herausgeholt
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    title_deArray = [dbConnect getLinkTitle_de];
    url_deArray = [dbConnect getLinkUrl_de];
    [dbConnect closeDb];

    
    linkListe = [[NSMutableArray alloc] init];
    for (int i=0; i<[title_deArray count]; i++) {
        Links *link = [[Links alloc] init];
        link.title_de = [title_deArray objectAtIndex:i];
        link.url_de = [url_deArray objectAtIndex:i];
        
        [linkListe addObject:link];
        
        // Zählt Linkanzahl und gibt sie im Log aus
        // NSLog(@"%i", [linkListe count]);
    }

}

-(void)viewWillAppear:(BOOL)animated {
    // Arraysdeklaration der Zwischenspeicher
    NSMutableArray *title_deArray;
    NSMutableArray *url_deArray;
    
    // Datenbank wird geöffnet und Daten herausgeholt
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    title_deArray = [dbConnect getLinkTitle_de];
    url_deArray = [dbConnect getLinkUrl_de];
    [dbConnect closeDb];
    
    
    linkListe = [[NSMutableArray alloc] init];
    for (int i=0; i<[title_deArray count]; i++) {
        Links *link = [[Links alloc] init];
        link.title_de = [title_deArray objectAtIndex:i];
        link.url_de = [url_deArray objectAtIndex:i];
        
        [linkListe addObject:link];
        
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
    return [linkListe count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LinksCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Links *link = [[Links alloc] init];
    link = [linkListe objectAtIndex:indexPath.row];
    
    cell.textLabel.text = link.title_de;
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
        
        Links *link = [[Links alloc] init];
        link = [linkListe objectAtIndex:myIndexPath.row];
        website.websiteName = link.url_de;
        
    
                       
    }

}



@end
