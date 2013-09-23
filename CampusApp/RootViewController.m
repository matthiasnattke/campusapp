//
// RootViewController.m

#import "RootViewController.h"
#import "DataFileToObjectParser.h"
#import "Produkt.h"
//#import "MensaViewController-old.h"

@implementation RootViewController

@synthesize XMLactivity, tabelle, filteredListContent, savedSearchTerm, savedScopeButtonIndex, searchWasActive;


- (void)viewDidLoad {
    
    
    self.navigationItem.title = @"Mensaplan";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
    [[[self tabBarController] tabBar] setBackgroundImage:[UIImage imageNamed:@"tabbar"]];
    [[[self tabBarController] tabBar] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbaritem"]];
    //Start Activity Indicator, while XML is loading
    XMLactivity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140.0f, 290.0f, 40.0f, 40.0f)];
    [XMLactivity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    //Activity View show
    [self.view addSubview:XMLactivity];
    
    //Animation start
    [XMLactivity startAnimating];
    
    //XML parsen
    [self performSelector: @selector(doXMLParsing) 
               withObject: nil 
               afterDelay: 0];
    return;
}


- (void) doXMLParsing
{
    //start new Thread
    
    // create a filtered list that will contain products for the search results table
	self.filteredListContent = [NSMutableArray arrayWithCapacity:[self.tabelle count]];
	
	// restore search settings if they were saved in didReceiveMemoryWarning.
    if (self.savedSearchTerm)
	{
        [self.searchDisplayController setActive:self.searchWasActive];
        [self.searchDisplayController.searchBar setSelectedScopeButtonIndex:self.savedScopeButtonIndex];
        [self.searchDisplayController.searchBar setText:savedSearchTerm];
        
        self.savedSearchTerm = nil;
    }
	
	self.tableView.scrollEnabled = YES;
    
	tabelle = [[NSMutableArray alloc] init];	
    
	NSURL *url = [NSURL URLWithString: @"http://www.studentenwerk-frankfurt.de/2011/ClassPackage/App_IKMZ_BTU"];
	XMLToObjectParser *myParser = [[XMLToObjectParser alloc] parseXMLAtURL:url toObject:@"Tagesmenu" parseError:nil];
	
	for(int i = 0; i < [[myParser items] count]; i++) {
		Tagesmenu *new = [[Tagesmenu alloc] init];
		new = (Tagesmenu *)[[myParser items] objectAtIndex:i];
		[tabelle addObject:new];
        
        [self.tableView reloadData];
    }
    //Activity Indicator stop
    [XMLactivity stopAnimating];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
*/


/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/


/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/


- (void)viewDidDisappear:(BOOL)animated {
	//[super viewDidDisappear:animated];
 // save the state of the search UI so that it can be restored if the view is re-created
 self.searchWasActive = [self.searchDisplayController isActive];
 self.savedSearchTerm = [self.searchDisplayController.searchBar text];
 self.savedScopeButtonIndex = [self.searchDisplayController.searchBar selectedScopeButtonIndex];
}


/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
    self.filteredListContent = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.filteredListContent count];
    }
	else
	{
        return [tabelle count];
    }
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
    }
    //Titeltext for TableView
    NSString *TableText = [[NSString alloc] initWithFormat:@"%@", [[tabelle objectAtIndex:indexPath.row] Wochentag]];
    //NSString *TableText2 = [[NSString alloc] initWithFormat:@"Kategorie %@", [[tabelle objectAtIndex:indexPath.row] Kategorie]];
    
    //Search
    Tagesmenu * new = nil;
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        new = [self.filteredListContent objectAtIndex:indexPath.row];
        cell.textLabel.text = new.Wochentag;
        //cell.detailTextLabel.text = new.Kategorie;
        
        cell.textLabel.numberOfLines = 1;
        cell.detailTextLabel.numberOfLines = 1;
        
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
        cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    }
	else
	{
        new = [self.tabelle objectAtIndex:indexPath.row];

        cell.textLabel.text=TableText;	
        //cell.detailTextLabel.text = TableText2;
        
        cell.textLabel.numberOfLines = 1;
        cell.detailTextLabel.numberOfLines = 1;
        
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
        cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    }
    return cell;
}


//Background for the Cells
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    UIColor *color = ((indexPath.row % 2) == 0) ? [UIColor colorWithRed:180.0/255 green:190.0/255 blue:150.0/255 alpha:1] : [UIColor clearColor];
    cell.backgroundColor = color;
}


//Activate the Arrows
-(void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    MensaViewController-old *MensaViewController-old = [[MensaViewController-old alloc] initWithNibName:@"MensaView" bundle:nil];
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        MensaViewController-old.myProdukt=[filteredListContent objectAtIndex:indexPath.row];
        self.navigationItem.title=[[filteredListContent objectAtIndex:indexPath.row] Wochentag];
    }
	else
	{
        MensaViewController-old.myProdukt=[tabelle objectAtIndex:indexPath.row];
        self.navigationItem.title=[[tabelle objectAtIndex:indexPath.row] Wochentag];
    }
    
	[self.navigationController pushViewController:MensaViewController-old animated:YES];
} 


// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here -- for example, create and push another view controller.
    
    /*
    If the requesting table view is the search display controller's table view, configure the next view controller using the filtered content, otherwise use the main list.
    */
    
	MensaViewController-old *MensaViewController-old = [[MensaViewController-old alloc] init/*WithNibName:@"MensaView" bundle:nil*/];
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        MensaViewController-old.myProdukt=[filteredListContent objectAtIndex:indexPath.row];
        self.navigationItem.title=[[filteredListContent objectAtIndex:indexPath.row] Wochentag];
    }
	else
	{
        MensaViewController-old.myProdukt=[tabelle objectAtIndex:indexPath.row];
        self.navigationItem.title=[[tabelle objectAtIndex:indexPath.row] Wochentag];
    }
    
	[self.navigationController pushViewController:MensaViewController-old animated:YES];

}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	/*
	 Update the filtered array based on the search text and scope.
	 */
	
	[self.filteredListContent removeAllObjects]; // First clear the filtered array.
	
	/*
	 Search the main list for Produkts whose type matches the scope (if selected) and whose name matches searchText; add items that match to the filtered array.
	 */
    
    for (Tagesmenu *new in tabelle)
	{
        //Kategorie -> Windows
		if ([scope isEqualToString:@"Windows"] && [new.Essen1 isEqualToString:@"Windows"])
            
		{
			NSRange result = [new.Wochentag rangeOfString:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
            
            if (result.location != NSNotFound)
            {
                [self.filteredListContent addObject:new];
            }
        }

        //Kategorie -> Apple
       if ([scope isEqualToString:@"Apple"] && [new.Essen2 isEqualToString:@"MAC OS X"])
           
		{
			NSRange result = [new.Wochentag rangeOfString:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
       
            if (result.location != NSNotFound)
            {
                [self.filteredListContent addObject:new];
            }
        }
        
        //Kategorie -> Apple, Windows
        if ([scope isEqualToString:@"Apple&Win"] && [new.Essen3 isEqualToString:@"MAC OS X Windows"])
            
		{
			NSRange result = [new.Wochentag rangeOfString:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
            
            if (result.location != NSNotFound)
            {
                [self.filteredListContent addObject:new];
            }
        }
        
        //All
        if ([scope isEqualToString:@"Alle"])
            
		{
			NSRange result = [new.Wochentag rangeOfString:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)];
            
            if (result.location != NSNotFound)
            {
                [self.filteredListContent addObject:new];
            }
        }
    }
}  
		

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
    [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
        return YES;
    if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        return YES;
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
        return NO;
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
        return NO;
    
    return YES;
}

@end

