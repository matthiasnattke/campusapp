//
//  AppDelegate.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "AppDelegate.h"
#import "Essen.h"
#import "Links.h"
#import "Events.h"
#import "News.h"
#import "DataFileToObjectParser.h"
#import "DbConnect.h"
#import "Linkss.h"

@implementation AppDelegate

@synthesize essenListe, linkListe, eventListe, newsListe, dbConnect;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    sleep(0);
    
    

    // Override point for customization after application launch.
    return YES;
}

- (void) doXMLParsingMensa
{
	essenListe = [[NSMutableArray alloc] init];
    
	NSURL *url = [NSURL URLWithString: @"http://www.studentenwerk-frankfurt.de/2011/ClassPackage/App_IKMZ_BTU/"];
	XMLToObjectParser *myParser = [[XMLToObjectParser alloc] parseXMLAtURL:url toObject:@"Tagesmenu" parseError:nil];
	
	for(int i = 0; i < [[myParser items] count]; i++) {
		Essen *new = [[Essen alloc] init];
		new = (Essen *)[[myParser items] objectAtIndex:i];
		[essenListe addObject:new];
    }
    
    [dbConnect openDb];
    for(int i = 0; i < [essenListe count]; i++) {
        //Essen *essen = [[Essen alloc] init];
        Essen *essen = [essenListe objectAtIndex:i];
        //NSLog(@"Tag: %@, Essen: %@", essen.Wochentag, essen.Essen4);
        [dbConnect updateMensa:essen];
    }
    [dbConnect closeDb];
}

- (void) doXMLParsingEvents
{
	eventListe = [[NSMutableArray alloc] init];
    
	NSURL *url = [NSURL URLWithString: @"http://www.tu-cottbus.de/oracle-gateway/php/rss2feed_veranstaltungen.php"];
	XMLToObjectParser *myyParser = [[XMLToObjectParser alloc] parseXMLAtURL:url toObject:@"item" parseError:nil];
	
	for(int i = 0; i < [[myyParser items] count]; i++) {
		Events *new = [[Events alloc] init];
		new = (Events *)[[myyParser items] objectAtIndex:i];
		[eventListe addObject:new];
    }
    
    [dbConnect openDb];
    [dbConnect deleteTableEvents];
    for(int i = 0; i < [eventListe count]; i++) {
        //Essen *essen = [[Essen alloc] init];
        Events *event = [eventListe objectAtIndex:i];
        [dbConnect updateEvent:event];
        //NSLog(@"Tag: %@", event.title);
    }
    [dbConnect closeDb];
}

- (void) doXMLParsingNews
{
	newsListe = [[NSMutableArray alloc] init];
    
	NSURL *url = [NSURL URLWithString: @"http://www.tu-cottbus.de/oracle-gateway/php/rss2feed_aktuelles.php"];
	XMLToObjectParser *myyParser = [[XMLToObjectParser alloc] parseXMLAtURL:url toObject:@"item" parseError:nil];
	
	for(int i = 0; i < [[myyParser items] count]; i++) {
		News *new = [[News alloc] init];
		new = (News *)[[myyParser items] objectAtIndex:i];
		[newsListe addObject:new];
    }
    
    [dbConnect openDb];
    [dbConnect deleteTableNews];
    
    
    for(int i = 0; i < [newsListe count]; i++) {
        //Essen *essen = [[Essen alloc] init];
        News *news = [newsListe objectAtIndex:i];
        [dbConnect updateNews:news];
        //NSLog(@"Tag: %@", news.pubDate);
    }
    [dbConnect closeDb];
}

-(void) doXMLParsingLinks {
    linkListe = [[NSMutableArray alloc] init];
    
	NSURL *url = [NSURL URLWithString: @"http://www.tu-cottbus.de/campusapp-data/getversion.php?db=links"];
	//[XMLToObjectParser *myParser = [[XMLToObjectParser alloc] parseXMLAtURL:url toObject:@"links" parseError:nil];
    
	
    /*
    Links *utube = [[Links alloc] init];
    utube.title_de = @"Youtube";
    utube.title_en = @"Youtube";
    utube.url_de = @"http://www.youtube.de";
    utube.url_en = @"http://www.youtube.com";
    */
    
    NSString *onlineVersion = @"3";
    
    [dbConnect openDb];
    NSString *linkVersion = [dbConnect getVersionNr:@"links"];
    
    // wenn veraltet, wird Linkliste upgedatet
    if([linkVersion isEqualToString:onlineVersion]) {
        //NSLog(@"gleiche Version");
    }
    else {
        NSLog(@" nicht gleiche Version");
        [dbConnect updateVersionNr:onlineVersion where:@"links"];
        [dbConnect deleteTableLinks];
        
      /*  NSURL *url = [NSURL URLWithString: @"http://www.tu-cottbus.de/campusapp-data/getdata.php?db=links&appversion=1&app=2"];
        XMLToObjectParser *myyParser = [[XMLToObjectParser alloc] parseXMLAtURL:url toObject:@"data" parseError:nil];
        
        for(int i = 0; i < [[myyParser items] count]; i++) {
            Links *new = [[Links alloc] init];
            new = (Links *)[[myyParser items] objectAtIndex:i];
            [linkListe addObject:new];
        }*/
        
        for(int i = 0; i < [linkListe count]; i++) {
            Links *link = [linkListe objectAtIndex:i];
            NSLog(@"Titel: %@, Link: %@", link.title_de, link.url_de);
            [dbConnect updateLinks:link];
        }      
            
        }

    
    
    [dbConnect closeDb];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    dbConnect = [[DbConnect alloc] init];
    //XML parsen
    [self performSelector: @selector(doXMLParsingMensa)
               withObject: nil
               afterDelay: 0];
    [self performSelector: @selector(doXMLParsingEvents)
               withObject: nil
               afterDelay: 0];
    [self performSelector: @selector(doXMLParsingNews)
               withObject: nil
               afterDelay: 0];
    [self performSelector: @selector(doXMLParsingLinks)
               withObject: nil
               afterDelay: 0];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
