//
//  WebcheckerViewController.h
//  BTU-CampusApp
//
//  Created by Matthias on 12.01.13.
//  Copyright (c) 2013 JMMMT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Reachability;
@interface WebcheckerViewController : UIViewController {
    
    IBOutlet UIWindow* window;
    IBOutlet UIView* contentView;
    IBOutlet UILabel* summaryLabel;
    
    IBOutlet UITextField* remoteHostLabel;
    IBOutlet UIImageView* remoteHostIcon;
    IBOutlet UITextField* remoteHostStatusField;
    
    IBOutlet UIImageView* internetConnectionIcon;
    IBOutlet UITextField* internetConnectionStatusField;
    
    IBOutlet UIImageView* localWiFiConnectionIcon;
    IBOutlet UITextField* localWiFiConnectionStatusField;
    
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
    
}

@end
