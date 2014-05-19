//
//  FakViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "FakViewController.h"
#import "Learnhouse.h"
#import "LHViewController.h"
#import "DbConnect.h"

@interface FakViewController ()

@end

@implementation FakViewController

@synthesize auswahlListen, compListe, dbConnect;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:NO];
    
    //Auswahlkategorien
    auswahlListen = [[NSMutableArray alloc] init];
    [auswahlListen addObject:@"Fakultät 1"];
    [auswahlListen addObject:@"Fakultät 2"];
    [auswahlListen addObject:@"Fakultät 3"];
    [auswahlListen addObject:@"Fakultät 4"];
    [auswahlListen addObject:@"Favoriten"];
    
    //Listen für Favoriten und Fakultät erstellen
    NSMutableArray *favoListe = [[NSMutableArray alloc] init];
    NSMutableArray *fak1Liste = [[NSMutableArray alloc] init];
    NSMutableArray *fak2Liste = [[NSMutableArray alloc] init];
    NSMutableArray *fak3Liste = [[NSMutableArray alloc] init];
    NSMutableArray *fak4Liste = [[NSMutableArray alloc] init];
    
    
    // Komplette Liste mit Lehrstuhllisten
    compListe  = [[NSMutableArray alloc] init];
    
    dbConnect = [[DbConnect alloc] init];
    
    [dbConnect openDb];
    
    NSMutableArray *nameFak1 = [dbConnect getFak1Name];
    NSMutableArray *instFak1 = [dbConnect getFak1Inst];
    NSMutableArray *urlFak1 = [dbConnect getFak1Url];
    NSMutableArray *favFak1 = [dbConnect getFak1Fav];
    NSMutableArray *nameFak2 = [dbConnect getFak2Name];
    NSMutableArray *instFak2 = [dbConnect getFak2Inst];
    NSMutableArray *urlFak2 = [dbConnect getFak2Url];
    NSMutableArray *favFak2 = [dbConnect getFak2Fav];
    NSMutableArray *nameFak3 = [dbConnect getFak3Name];
    NSMutableArray *instFak3 = [dbConnect getFak3Inst];
    NSMutableArray *urlFak3 = [dbConnect getFak3Url];
    NSMutableArray *favFak3 = [dbConnect getFak3Fav];
    NSMutableArray *nameFak4 = [dbConnect getFak4Name];
    NSMutableArray *instFak4 = [dbConnect getFak4Inst];
    NSMutableArray *urlFak4 = [dbConnect getFak4Url];
    NSMutableArray *favFak4 = [dbConnect getFak4Fav];
    
    [dbConnect closeDb];
    
    
    for(int i = 0; i < [nameFak1 count]; i++) {
        Learnhouse *house = [[Learnhouse alloc] init];
        house.name = [nameFak1 objectAtIndex:i];
        house.institute = [instFak1 objectAtIndex:i];
        house.url = [urlFak1 objectAtIndex:i];
        
        //Das Lehrstuhlobjekt erhält ihr den Status Favorit
        NSString *boolString = [favFak1 objectAtIndex:i];
        if([boolString isEqualToString:@"0"]) {
            house.fav = NO;
        }
        else {
            house.fav = YES;
        }
        
        house.fak = @"Fakultät 1";
        house.fakDB =@"fak1";
        
        // hier wird entschieden, ob das Lehrstuhlobjekt in die Favoritenliste gespeichert wird
        if(house.fav) {
            [favoListe addObject:house];// kommt in die Favoritenliste
        }
        [fak1Liste addObject:house];// kommt zusätzlich in die Fakultätsliste
        
    }
    [compListe addObject:fak1Liste];
    
    for(int i = 0; i < [nameFak2 count]; i++) {
        Learnhouse *house = [[Learnhouse alloc] init];
        house.name = [nameFak2 objectAtIndex:i];
        house.institute = [instFak2 objectAtIndex:i];
        house.url = [urlFak2 objectAtIndex:i];
        
        //Das Lehrstuhlobjekt erhält den Status Favorit
        NSString *boolString = [favFak2 objectAtIndex:i];
        if([boolString isEqualToString:@"0"]) {
            house.fav = NO;
        }
        else {
            house.fav = YES;
        }
        
        house.fak = @"Fakultät 2";
        house.fakDB =@"fak2";
        
        // hier wird entschieden, ob das Lehrstuhlobjekt in die Favoritenliste gespeichert wird
        if(house.fav) {
            [favoListe addObject:house];// kommt in die Favoritenliste
        }
        [fak2Liste addObject:house];// kommt zusätzlich in die Fakultätsliste
        
    }
    [compListe addObject:fak2Liste];
    
    
    for(int i = 0; i < [nameFak3 count]; i++) {
        Learnhouse *house = [[Learnhouse alloc] init];
        house.name = [nameFak3 objectAtIndex:i];
        house.institute = [instFak3 objectAtIndex:i];
        house.url = [urlFak3 objectAtIndex:i];
        
        //Das Lehrstuhlobjekt erhält den Status Favorit
        NSString *boolString = [favFak3 objectAtIndex:i];
        if([boolString isEqualToString:@"0"]) {
            house.fav = NO;
        }
        else {
            house.fav = YES;
        }
        
        house.fak = @"Fakultät 3";
        house.fakDB =@"fak3";
        
        // hier wird entschieden, ob das Lehrstuhlobjekt in die Favoritenliste gespeichert wird
        if(house.fav) {
            [favoListe addObject:house];// kommt in die Favoritenliste
        }
        [fak3Liste addObject:house];// kommt zusätzlich in die Fakultätsliste
        
    }
    [compListe addObject:fak3Liste];
    
    for(int i = 0; i < [nameFak4 count]; i++) {
        Learnhouse *house = [[Learnhouse alloc] init];
        house.name = [nameFak4 objectAtIndex:i];
        house.institute = [instFak4 objectAtIndex:i];
        house.url = [urlFak4 objectAtIndex:i];
        
        //Das Lehrstuhlobjekt erhält den Status Favorit
        NSString *boolString = [favFak4 objectAtIndex:i];
        if([boolString isEqualToString:@"0"]) {
            house.fav = NO;
        }
        else {
            house.fav = YES;
        }
        
        house.fak = @"Fakultät 4";
        house.fakDB =@"fak4";
        
        // hier wird entschieden, ob das Lehrstuhlobjekt in die Favoritenliste gespeichert wird
        if(house.fav) {
            [favoListe addObject:house];// kommt in die Favoritenliste
        }
        [fak4Liste addObject:house];// kommt zusätzlich in die Fakultätsliste
        
        
    }
    [compListe addObject:fak4Liste];
    
    [compListe addObject:favoListe];
    
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
    return [auswahlListen count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FakCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [auswahlListen objectAtIndex:indexPath.row];
    
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
    if ([[segue identifier] isEqualToString:@"ShowLhListe"]) {
        LHViewController *lhListe = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView
                                    indexPathForSelectedRow];
        
        lhListe.learnhouseListe = [compListe objectAtIndex:myIndexPath.row];
        lhListe.navigationItem.title = [auswahlListen objectAtIndex:myIndexPath.row];
        
    }
}


@end
