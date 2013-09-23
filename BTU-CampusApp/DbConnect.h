//
//  DbConnect.m
//  Die Datenbankverbindung der App
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Essen.h"
#import "Links.h"
#import "Hausaufgaben.h"
#import "Events.h"
#import "News.h"
#import "StEintrag.h"

@interface DbConnect : NSObject

-(void) openDb;
-(void) closeDb;
-(NSMutableArray *) getBuildingID:(NSString *)searchString;
-(void)updateHausaufgaben:(Hausaufgaben *)hausaufgabe;
-(void) deleteHausaufgaben:(Hausaufgaben *)hausaufgabe;
-(void)saveHausaufgaben:(Hausaufgaben *)hausaufgabe;
-(NSMutableArray *)getHAufgabe;
-(NSMutableArray *)getHBeschreibung;
-(NSMutableArray *)getHDatum;
-(NSMutableArray *)getHPriority;
-(NSMutableArray *)getHID;
-(NSMutableArray *) getHVID;
-(NSMutableArray *) getHVeranst;
-(NSMutableArray *) getHAufgabeWithID:(NSString *)vId;
-(NSMutableArray *) getHBeschreibungWithID:(NSString *)vId;
-(NSMutableArray *) getHDatumWithID:(NSString *)vId;
-(NSMutableArray *) getHPriorityWithID:(NSString *)vId;
-(NSMutableArray *) getHIDWithID:(NSString *)vId;
-(NSMutableArray *) getHVeranstWithID:(NSString *)vId;

-(NSMutableArray *) getBuildingID;
-(NSMutableArray *) getBName;
-(NSMutableArray *) getBGPSX;
-(NSMutableArray *) getBGPSY;
-(NSMutableArray *) getOpeningTitles;
-(NSMutableArray *) getOpeningMonday;
-(NSMutableArray *) getOpeningTuesday;
-(NSMutableArray *) getOpeningWednesday;
-(NSMutableArray *) getOpeningThursday;
-(NSMutableArray *) getOpeningFriday;
-(NSMutableArray *) getOpeningSaturday;
-(NSMutableArray *) getOpeningSunday;
-(NSMutableArray *) getOpeningLocationBuilding;
-(NSMutableArray *) getOpeningLocationRoom;
-(NSMutableArray *) getAbschlussNames;
-(NSMutableArray *) getAbschlussParameters;
-(NSMutableArray *) getSemesterNames;
-(NSMutableArray *) getSemesterParameters;
-(NSMutableArray *) getStudiengangNames;
-(NSMutableArray *) getStudiengangParameters;
-(NSMutableArray *) getLinkTitle_de;
-(NSMutableArray *) getLinkUrl_de;
-(NSMutableArray *) getVereinTitle_de;
-(NSMutableArray *) getVereinUrl_de;

-(NSMutableArray *) getFachschaftenName;
-(NSMutableArray *) getFachschaftenUrl;
-(NSMutableArray *) getFachschaftenEmail;
-(NSMutableArray *) getFachschaftenFak;

-(NSMutableArray *) getEventsdate;
-(NSMutableArray *) getEventstitle;
-(NSMutableArray *) getEventsurl;

-(NSMutableArray *) getNewsdate;
-(NSMutableArray *) getNewstitle;
-(NSMutableArray *) getNewsurl;

-(NSMutableArray *) getMensaWochentag;
-(NSMutableArray *) getMensaEssen1;
-(NSMutableArray *) getMensaEssen2;
-(NSMutableArray *) getMensaEssen3;
-(NSMutableArray *) getMensaEssen4;
-(NSMutableArray *) getMensaBio;
-(NSMutableArray *) getMensaAktionstag;

-(NSMutableArray *) getFak1Name;
-(NSMutableArray *) getFak1Inst;
-(NSMutableArray *) getFak1Url;
-(NSMutableArray *) getFak1Fav;
-(NSMutableArray *) getFak2Name;
-(NSMutableArray *) getFak2Inst;
-(NSMutableArray *) getFak2Url;
-(NSMutableArray *) getFak2Fav;
-(NSMutableArray *) getFak3Name;
-(NSMutableArray *) getFak3Inst;
-(NSMutableArray *) getFak3Url;
-(NSMutableArray *) getFak3Fav;
-(NSMutableArray *) getFak4Name;
-(NSMutableArray *) getFak4Inst;
-(NSMutableArray *) getFak4Url;
-(NSMutableArray *) getFak4Fav;
-(BOOL) saveLSFav:(NSString *)lsName inTable:(NSString *)lsTable;
-(BOOL) deleteLSFav:(NSString *)lsName inTable:(NSString *)lsTable;

-(NSMutableArray *)  getNameStMon;
-(NSMutableArray *) getVIdStMon;
-(NSMutableArray *) getBlockStMon;
-(NSMutableArray *) getOrtStMon;
-(NSMutableArray *)  getNameStDie;
-(NSMutableArray *) getVIdStDie;
-(NSMutableArray *) getBlockStDie;
-(NSMutableArray *) getOrtStDie;
-(NSMutableArray *)  getNameStMitt;
-(NSMutableArray *) getVIdStMitt;
-(NSMutableArray *) getBlockStMitt;
-(NSMutableArray *) getOrtStMitt;
-(NSMutableArray *)  getNameStDon;
-(NSMutableArray *) getVIdStDon;
-(NSMutableArray *) getBlockStDon;
-(NSMutableArray *) getOrtStDon;
-(NSMutableArray *)  getNameStFrei;
-(NSMutableArray *) getVIdStFrei;
-(NSMutableArray *) getBlockStFrei;
-(NSMutableArray *) getOrtStFrei;
-(BOOL) deleteStEintrag:(NSString *)vId;
-(void) saveStEintrag:(StEintrag *)eintrag;
-(void) updateStEintrag:(StEintrag *)eintrag;




// Update durch XML Parsen
-(NSString *)getVersionNr:(NSString *)dataString;
-(void) updateVersionNr:(NSString *) versionNr where:(NSString *)dataString;
-(void) updateMensa:(Essen *)Essen;
-(void) deleteTableEvents;
-(void) updateEvent:(Events *)Event;
-(void) deleteTableNews;
-(void) updateNews:(News *)News;
-(void) deleteTableLinks;
-(void) updateLinks:(Links *) linkListe;


@end