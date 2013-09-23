//
// RootViewController.h

@interface RootViewController : UITableViewController {
	
    NSMutableArray *tabelle; // Complete full Array
    NSMutableArray	*filteredListContent; // Array for the Searchresult
    
    //Activity Indicator
    IBOutlet UIActivityIndicatorView *XMLactivity;
    
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *XMLactivity;
@property (nonatomic, retain) NSMutableArray *tabelle;
@property (nonatomic, retain) NSMutableArray *filteredListContent;
@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;

@end
