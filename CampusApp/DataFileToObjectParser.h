//
// DataFileToObjectParser.h
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>

@interface XMLToObjectParser : NSObject <NSXMLParserDelegate> {
    
	NSString *NameOfClass;
	NSMutableArray *items;
	NSObject *item;    
	NSString *CurrentNode;
	NSMutableString *CNodeContent;
}

- (NSArray *)items;

- (id)parseXMLAtURL:(NSURL *)url 
		   toObject:(NSString *)aClassName 
		 parseError:(NSError **)error;

@end
