//
//  TUSafariActivity.h
//
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "TUSafariActivity.h"

// implementiert verschiedene Knöpfe zur URL-Weitergabe in andere Systemdienste

@implementation TUSafariActivity
{
	NSURL *_URL;
}

- (NSString *)activityType
{
	return NSStringFromClass([self class]);
}

- (NSString *)activityTitle
{
	return NSLocalizedStringFromTable(@"Safari", @"TUSafariActivity", nil);
}

- (UIImage *)activityImage
{
	return [UIImage imageNamed:@"Safari"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]] && [[UIApplication sharedApplication] canOpenURL:activityItem]) {
			return YES;
		}
	}
	
	return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]]) {
			_URL = activityItem;
		}
	}
}

- (void)performActivity
{
	BOOL completed = [[UIApplication sharedApplication] openURL:_URL];
	
	[self activityDidFinish:completed];
}

@end
