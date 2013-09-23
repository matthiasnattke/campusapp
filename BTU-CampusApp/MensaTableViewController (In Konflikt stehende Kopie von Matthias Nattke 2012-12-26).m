//
//  MensaTableViewController.m
//  BTU-CampusApp
//
//  Created by Matthias on 26.12.12.
//  Copyright (c) 2012 JMMMT. All rights reserved.
//

#import "MensaTableViewController.h"
#import "DbConnect.h"
#import "Essen.h"
#import "MensaViewController.h"

@interface MensaTableViewController ()

@property (nonatomic, strong) NSMutableArray *MensaArray;
@property (nonatomic, strong) DbConnect *dbConnect;

@end

@implementation MensaTableViewController

@synthesize MensaArray, dbConnect;

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
    NSMutableArray *MensaWochentagArray;
    NSMutableArray *MensaEssen1Array;
    NSMutableArray *MensaEssen2Array;
    NSMutableArray *MensaEssen3Array;
    NSMutableArray *MensaEssen4Array;
    NSMutableArray *MensaBioArray;
    NSMutableArray *MensaAktionstagArray;
    
    // Datenbank wird geöffnet und Daten herausgeholt
    
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    MensaWochentagArray = [dbConnect getMensaWochentag];
    MensaEssen1Array = [dbConnect getMensaEssen1];
    MensaEssen2Array = [dbConnect getMensaEssen2];
    MensaEssen3Array = [dbConnect getMensaEssen3];
    MensaEssen4Array = [dbConnect getMensaEssen4];
    MensaBioArray = [dbConnect getMensaBio];
    MensaAktionstagArray = [dbConnect getMensaAktionstag];
    [dbConnect closeDb];
    
    MensaArray = [[NSMutableArray alloc] init];
    for (int i=0; i<[MensaWochentagArray count]; i++) {
        
        Essen *food = [[Essen alloc] init];
        food.Wochentag = [MensaWochentagArray objectAtIndex:i];
        food.Essen1 = [MensaEssen1Array objectAtIndex:i];
        food.Essen2 = [MensaEssen2Array objectAtIndex:i];
        food.Essen3 = [MensaEssen3Array objectAtIndex:i];
        food.Essen4 = [MensaEssen4Array objectAtIndex:i];
        food.Bio = [MensaBioArray objectAtIndex:i];
        food.Aktionstag = [MensaAktionstagArray objectAtIndex:i];   
        [MensaArray addObject:food];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
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

@end
