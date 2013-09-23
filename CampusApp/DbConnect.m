//
//  DbConnect.m
//  Die Datenbankverbindung der App
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "DbConnect.h"
#import "Essen.h"
#import "Hausaufgaben.h"
#import "Events.h"
#import "StEintrag.h"

@implementation DbConnect {
    sqlite3 *database;
    NSString *dbPath;
    sqlite3_stmt *statement;
}

-(void) openDb {
    // Den Pfad zur Documents-Directory in path speichern
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    dbPath = [documentsDirectory stringByAppendingPathComponent:@"BTU-CampusApp.sqlite3"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // Die Datenbank aus dem Bundle in die Documents-Directory kopieren
    NSString *pathInMainBundle = [[NSBundle mainBundle] pathForResource:@"BTU-CampusApp" ofType:@"sqlite3"];
    if (![fileManager fileExistsAtPath:dbPath]) {
        //NSLog(@"Datenbank noch nicht vorhanden");
        [fileManager copyItemAtPath:pathInMainBundle toPath:dbPath error:nil];
    }
    
    // Die Datenbank öffnen
    int result = sqlite3_open([dbPath UTF8String], &database);
    if (result != SQLITE_OK) {
        sqlite3_close(database);
        //NSLog(@"Fehler beim Öffnen der Datenbank");
        return;
    }
    //NSLog(@"Datenbank erfolgreich geöffnet");
}

-(void) closeDb {
    sqlite3_close(database);
    //NSLog(@"Datenbank erfolgreich geschlossen");
}

// Ruft Titel der ToDoList aus Datenbank ab
-(NSMutableArray *) getHAufgabe {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT title FROM homework ORDER BY priority", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHBeschreibung {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT description FROM homework ORDER BY priority", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHDatum {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT date FROM homework ORDER BY priority", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *) getHPriority{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT priority FROM homework ORDER BY priority", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *)getHID {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT rowid FROM homework ORDER BY priority", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHVeranst {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT veranstaltung FROM homework ORDER BY priority", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHVID{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT veranstID FROM homework ORDER BY priority", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHAufgabeWithID:(NSString *)vId {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT title FROM homework WHERE veranstID = '%@'", vId];
    
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHBeschreibungWithID:(NSString *)vId {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT description FROM homework WHERE veranstID = '%@'", vId];
    
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHDatumWithID:(NSString *)vId{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT date FROM homework WHERE veranstID = '%@'", vId];
    
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *) getHPriorityWithID:(NSString *)vId{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT priority FROM homework WHERE veranstID = '%@'", vId];
    
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}



-(NSMutableArray *)getHIDWithID:(NSString *)vId {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT rowid FROM homework WHERE veranstID = '%@'", vId];
    
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getHVeranstWithID:(NSString *)vId {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSString *sql = [NSString stringWithFormat:@"SELECT veranstaltung FROM homework WHERE veranstID = '%@'", vId];
    
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}




// fügt Hausaufgaben der Datenbank hinzu
-(void)saveHausaufgaben:(Hausaufgaben *)hausaufgabe {
    NSString *updateSQL = [NSString stringWithFormat:@"INSERT INTO homework (title, description, date, priority, veranstaltung, veranstID) VALUES ('%@','%@','%@','%@', '%@', '%@')",hausaufgabe.aufgabe, hausaufgabe.beschreibung, hausaufgabe.datum, hausaufgabe.priority, hausaufgabe.veranstaltung, hausaufgabe.veranstaltungID];
    
    
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    if(sqlite3_step(statement) == SQLITE_DONE) {
    
    }
    else {
       
    }
    
    
    sqlite3_finalize(statement);
    
}

// erneuert die Hausaufgabendaten
-(void) updateHausaufgaben:(Hausaufgaben *)hausaufgabe {
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE homework SET title = '%@', description = '%@', date = '%@', priority = '%@', veranstaltung = '%@',veranstID = '%@' WHERE rowid = '%@'", hausaufgabe.aufgabe, hausaufgabe.beschreibung, hausaufgabe.datum, hausaufgabe.priority,hausaufgabe.veranstaltung,hausaufgabe.veranstaltungID, hausaufgabe.ID];
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
    
    
    sqlite3_finalize(statement);
    
}

// löscht Hausaufgaben aus der Datenbank
-(void) deleteHausaufgaben:(Hausaufgaben *)hausaufgabe {
    NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM homework WHERE rowid = '%@'", hausaufgabe.ID];
    
    
    sqlite3_prepare_v2(database, [deleteSQL UTF8String], -1, &statement, nil);
    
    if(sqlite3_step(statement) == SQLITE_DONE) {

    }
    else {
    }
    
    
    sqlite3_finalize(statement);
    
}

// end Hausaufgaben

// holt die GebäudeID aus der Datenbank
-(NSMutableArray *) getBuildingID:(NSString *)searchString {
    NSString *sqlName = @"SELECT id FROM building_tags  WHERE tags";
    NSString *commandName = [NSString stringWithFormat:@"%@ = '%@'",sqlName, searchString];

    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, [commandName UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// holt alle Gebäudenamen
-(NSMutableArray *) getBName {
        
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT name FROM buildings", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

// holt alle GebäudeX-Koordinaten
-(NSMutableArray *) getBGPSX {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT gpsx FROM buildings", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

// Ruft Titel der Öffnungszeiten aus Datenbank ab
-(NSMutableArray *) getOpeningTitles {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT title_de FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft Öffnungszeiten des Montages aus Datenbank ab
-(NSMutableArray *) getOpeningMonday {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT monday FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft Öffnungszeiten des Dienstages aus Datenbank ab
-(NSMutableArray *) getOpeningTuesday {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT tuesday FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft Öffnungszeiten des Mittwochs aus Datenbank ab
-(NSMutableArray *) getOpeningWednesday {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT wednesday FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft Öffnungszeiten des Donnerstages aus Datenbank ab
-(NSMutableArray *) getOpeningThursday {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT thursday FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft Öffnungszeiten des Freitages aus Datenbank ab
-(NSMutableArray *) getOpeningFriday {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT friday FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft Öffnungszeiten des Samstages aus Datenbank ab
-(NSMutableArray *) getOpeningSaturday {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT saturday FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft Öffnungszeiten des Sonntages aus Datenbank ab
-(NSMutableArray *) getOpeningSunday {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT sunday FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft das Gebäude der Öffnungzeiten aus Datenbank ab
-(NSMutableArray *) getOpeningLocationBuilding {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT location_building FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// Ruft den Raum der Öffnungzeiten aus Datenbank ab
-(NSMutableArray *) getOpeningLocationRoom {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(database, "SELECT location_room FROM openinghours", -1, &statement, nil) == SQLITE_OK) {
        
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

// holt alle GebäudeY-Koordinaten
-(NSMutableArray *) getBGPSY{
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT gpsy FROM buildings", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

// Abschlussdaten

-(NSMutableArray *) getAbschlussNames {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT col_1 FROM Abschluss", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;

}
-(NSMutableArray *) getAbschlussParameters {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT col_2 FROM Abschluss", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;

}
// end Abschlussdaten

// Semesterdaten

-(NSMutableArray *) getSemesterNames {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT col_1 FROM Semester", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
-(NSMutableArray *) getSemesterParameters {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT col_2 FROM Semester", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
// end ASemesterdaten

// Semesterdaten

-(NSMutableArray *) getStudiengangNames {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT col_1 FROM Studiengang", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
-(NSMutableArray *) getStudiengangParameters {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT col_2 FROM Studiengang", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
// end Semesterdaten

// Linkdaten

-(NSMutableArray *) getLinkTitle_de {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT title_de FROM links", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
-(NSMutableArray *) getLinkUrl_de {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT link_de FROM links", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
// end Linkdaten

// Fachschaftsdaten

-(NSMutableArray *) getFachschaftenName {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT name FROM studentcouncil", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
-(NSMutableArray *) getFachschaftenUrl {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT url FROM studentcouncil", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
-(NSMutableArray *) getFachschaftenEmail {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT email FROM studentcouncil", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
-(NSMutableArray *) getFachschaftenFak {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT fak FROM studentcouncil", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
// end Fachschaftsdaten

// Vereindaten

-(NSMutableArray *) getVereinTitle_de {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT title_de FROM vereine", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
-(NSMutableArray *) getVereinUrl_de {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT link_de FROM vereine", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}
// end Vereindaten

// Mensadaten

-(NSMutableArray *) getMensaWochentag {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT Wochentag FROM mensaplan", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getMensaEssen1 {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT Essen1 FROM mensaplan", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getMensaEssen2 {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT Essen2 FROM mensaplan", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getMensaEssen3 {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT Essen3 FROM mensaplan", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getMensaEssen4 {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT Essen4 FROM mensaplan", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getMensaBio {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT Bio FROM mensaplan", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getMensaAktionstag {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT Aktionstag FROM mensaplan", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

// end Mensdaten

// Lehrstuhldaten


-(NSMutableArray *) getFak1Name {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT lehrstuhl FROM fak1", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak1Inst {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT institute FROM fak1", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak1Url {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT url FROM fak1", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getFak1Fav {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT favorite FROM fak1", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak2Name {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT lehrstuhl FROM fak2", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak2Inst {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT institute FROM fak2", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak2Url {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT url FROM fak2", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getFak2Fav {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT favorite FROM fak2", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}


-(NSMutableArray *) getFak3Name {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT lehrstuhl FROM fak3", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak3Inst {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT institute FROM fak3", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak3Url {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT url FROM fak3", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getFak3Fav {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT favorite FROM fak3", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}


-(NSMutableArray *) getFak4Name {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT lehrstuhl FROM fak4", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}


-(NSMutableArray *) getFak4Inst {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT institute FROM fak1", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getFak4Url {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT url FROM fak4", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getFak4Fav {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT favorite FROM fak4", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

// Stundenplandaten
-(NSMutableArray *) getNameStMon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT name FROM STMontag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getVIdStMon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT vID FROM STMontag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *) getBlockStMon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT block FROM STMontag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getOrtStMon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT ort FROM STMontag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getNameStDie {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT name FROM STDienstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getVIdStDie {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT vID FROM STDienstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *) getBlockStDie {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT block FROM STDienstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getOrtStDie {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT ort FROM STDienstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getNameStMitt {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT name FROM STMittwoch", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getVIdStMitt {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT vID FROM STMittwoch", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *) getBlockStMitt {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT block FROM STMittwoch", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;

}

-(NSMutableArray *) getOrtStMitt {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT ort FROM STMittwoch", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getNameStDon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT name FROM STDonnerstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getVIdStDon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT vID FROM STDonnerstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *) getBlockStDon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT block FROM STDonnerstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getOrtStDon {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT ort FROM STDonnerstag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getNameStFrei {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT name FROM STFreitag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}

-(NSMutableArray *) getVIdStFrei {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT vID FROM STFreitag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
}


-(NSMutableArray *) getBlockStFrei {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT block FROM STFreitag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(NSMutableArray *) getOrtStFrei {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT ort FROM STFreitag", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
}

-(BOOL)deleteStEintrag:(NSString *)vId {
    NSString *montag = [NSString stringWithFormat:@"UPDATE STMontag SET vID = '', name = '' WHERE vID = '%@'", vId];
    NSString *dienstag = [NSString stringWithFormat:@"UPDATE STDienstag SET vID = '', name = '' WHERE vID = '%@'", vId];
    NSString *mittwoch = [NSString stringWithFormat:@"UPDATE STMittwoch SET vID = '', name = '' WHERE vID = '%@'", vId];
    NSString *donnerstag = [NSString stringWithFormat:@"UPDATE STDonnerstag SET vID = '', name = '' WHERE vID = '%@'", vId];
    NSString *freitag = [NSString stringWithFormat:@"UPDATE STFreitag SET vID = '', name = '' WHERE vID = '%@'", vId];
    
    BOOL upadteErfolg;
    
    // Checken ist notwendig, damit es einen Effekt hat
    sqlite3_prepare_v2(database, [montag UTF8String], -1, &statement, nil);
    upadteErfolg = sqlite3_step(statement) == SQLITE_DONE;
    sqlite3_prepare_v2(database, [dienstag UTF8String], -1, &statement, nil);
    upadteErfolg = sqlite3_step(statement) == SQLITE_DONE;
    sqlite3_prepare_v2(database, [mittwoch UTF8String], -1, &statement, nil);
    upadteErfolg = sqlite3_step(statement) == SQLITE_DONE;
    sqlite3_prepare_v2(database, [donnerstag UTF8String], -1, &statement, nil);
    upadteErfolg = sqlite3_step(statement) == SQLITE_DONE;
    sqlite3_prepare_v2(database, [freitag UTF8String], -1, &statement, nil);
    upadteErfolg = sqlite3_step(statement) == SQLITE_DONE;
    
   
    sqlite3_finalize(statement);
    
    return upadteErfolg;
}

// fügt Stundenplaneintrag der Datenbank hinzu
-(void)saveStEintrag:(StEintrag *)eintrag {
    NSString *saveSQL = [NSString stringWithFormat:@"UPDATE %@ SET vID = '%@', name = '%@', ort = '%@' WHERE block = '%@'", eintrag.dbTag,eintrag.vId, eintrag.name,eintrag.ort, eintrag.block];
    sqlite3_prepare_v2(database, [saveSQL UTF8String], -1, &statement, nil);
    if(sqlite3_step(statement) == SQLITE_DONE) {
        NSLog(@"Ja");
    }
    else {
        NSLog(@"Nein");
    }
    
    
    sqlite3_finalize(statement);
    
}

//end Stundenplan

-(BOOL) saveLSFav:(NSString *)lsName inTable:(NSString *)lsTable {
    
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE %@ SET favorite = '1' WHERE lehrstuhl = '%@'", lsTable, lsName];
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    BOOL upadteErfolg = sqlite3_step(statement) == SQLITE_DONE;
    
    sqlite3_finalize(statement);
    
    return upadteErfolg;
    

}

-(BOOL) deleteLSFav:(NSString *)lsName inTable:(NSString *)lsTable {
    
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE %@ SET favorite = '0' WHERE lehrstuhl = '%@'", lsTable, lsName];
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    BOOL upadteErfolg = sqlite3_step(statement) == SQLITE_DONE;
    
    sqlite3_finalize(statement);
    
    return upadteErfolg;

}
// end Lehrstuhldaten

//hole Eventdaten
-(NSMutableArray *) getEventstitle {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT title FROM Events", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getEventsdate {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT date FROM Events", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getEventsurl {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT url FROM Events", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

//hole Newsdaten

-(NSMutableArray *) getNewstitle {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT title FROM News", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getNewsdate {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT date FROM News", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

-(NSMutableArray *) getNewsurl {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (sqlite3_prepare_v2(database, "SELECT url FROM News", -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    
    return items;
    
    
}

//XMLParsen

// Version Nummern der Online Datenbank
-(NSString*)getVersionNr:(NSString *)dataString {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSString *versionSQL = [NSString stringWithFormat:@"SELECT version FROM data_version where data = '%@'", dataString];
    
    if (sqlite3_prepare_v2(database, [versionSQL UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSString *message = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
            [items addObject:message];
        }
        
        sqlite3_finalize(statement);
    }
    return [items objectAtIndex:0];
}

-(void) updateVersionNr:(NSString *) versionNr where:(NSString *)dataString {
    
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE data_version SET version = '%@' WHERE data = '%@'",versionNr, dataString];
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
    
    sqlite3_finalize(statement);
    
    
}

-(void) updateMensa:(Essen *)Essen {
    NSString *updateSQL = [NSString stringWithFormat:@"UPDATE mensaplan SET Essen1 = '%@', Essen2 = '%@', Essen3 = '%@', Essen4 = '%@', Aktionstag = '%@', Bio = '%@'  WHERE Wochentag = '%@'",  Essen.Essen1, Essen.Essen2, Essen.Essen3, Essen.Essen4, Essen.Aktionstag, Essen.Bio, Essen.Wochentag];
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }

    
    sqlite3_finalize(statement);
    
}

-(void) deleteTableEvents {
    NSString *delete = [NSString stringWithFormat:@"DELETE FROM Events"];
    sqlite3_prepare_v2(database, [delete UTF8String], -1, &statement, nil);
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
    
    
    sqlite3_finalize(statement);
}

-(void) updateEvent:(Events *)Event {
    NSString *updateSQL = [NSString stringWithFormat:@"INSERT INTO Events (title,date, url) VALUES ('%@','%@','%@')",  Event.title, Event.pubDate, Event.link];
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
    
    
    sqlite3_finalize(statement);
    
}

-(void) deleteTableNews {
    NSString *delete = [NSString stringWithFormat:@"DELETE FROM News"];
    sqlite3_prepare_v2(database, [delete UTF8String], -1, &statement, nil);
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
    
    
    sqlite3_finalize(statement);
}

-(void) updateNews:(News *)News {
    NSString *updateSQL = [NSString stringWithFormat:@"INSERT INTO News (title,date, url) VALUES ('%@','%@','%@')",  News.title, News.pubDate, News.link];
    sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, nil);
    
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
    
    
    sqlite3_finalize(statement);
    
}

-(void) deleteTableLinks {
    NSString *delete = [NSString stringWithFormat:@"DELETE FROM links"];
    sqlite3_prepare_v2(database, [delete UTF8String], -1, &statement, nil);
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
   
    
    sqlite3_finalize(statement);
}

-(void) updateLinks:(Links*)link {


    NSString *insert = [NSString stringWithFormat:@"INSERT INTO links (title_de,title_en, link_de, link_en) VALUES ('%@','%@','%@','%@')", link.title_de, link.title_en, link.url_de, link.url_en];

    sqlite3_prepare_v2(database, [insert UTF8String], -1, &statement, nil);
    
    if(sqlite3_step(statement) == SQLITE_DONE) {
    }
    else {
    }
    
    sqlite3_finalize(statement);
}

//end XMLParsen

@end