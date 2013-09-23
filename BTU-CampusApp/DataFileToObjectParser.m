//
// DataFileToObjectParser.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "DataFileToObjectParser.h"

@implementation XMLToObjectParser


- (NSArray *)items
{
	return items;
}


// Ruft NSXMLParser auf, übergibt die zu parsende URL und parst die XML-Quelle
// Treten Fehler auf, so gebe eine Fehlermeldung

- (id)parseXMLAtURL:(NSURL *)url 
		   toObject:(NSString *)aClassName 
		 parseError:(NSError **)error
{
	items = [[NSMutableArray alloc] init];
	NameOfClass = aClassName;

    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
	[parser setDelegate:self];
	
	[parser parse];
	
	if([parser parserError] && error) {
		*error = [parser parserError];
	}
	return self;
}

// Nimmt erstes zu parsendes Element und baut daraus ein Objekt

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)element
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict
{	
	if([element isEqualToString:NameOfClass]) {
		item = [[NSClassFromString(NameOfClass) alloc] init];
	}
	else {
		CurrentNode = [element copy];
		CNodeContent = [[NSMutableString alloc] init];
	}
    
    if([element isEqualToString:@"links"]) {
		item = [attributeDict objectForKey:@"title_de"];
	}

}

// Nimmt geparste Elemente bis zum letzten und baut Objekte daraus.

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)element
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName

{	
	if([element isEqualToString:NameOfClass]) {
		[items addObject:item];
		item = nil;
	}
	else if([element isEqualToString:CurrentNode]) {     
		[item setValue:CNodeContent forKey:element];
		
		CNodeContent = nil;
		
		CurrentNode = nil;
	}
}

// prüft ob Zeichen ein String ist

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string
{   
	[CNodeContent appendString:string];
}

@end
