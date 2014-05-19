//
//  haViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "haViewController.h"
#import "StEintrag.h"
#import "HAeditViewController.h"
#import "ToDoListViewController.h"
#import "STErstellenViewController.h"
#import "DbConnect.h"

@interface haViewController ()

@end

@implementation haViewController

@synthesize eintrag, nameLabel, blockLabel,vIDLabel, dbConnect,hausaufgabenArray, deleteButton, anzeigenButton, hinzuButton, erstellenButton, bearbeitenButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// löscht den Stundenplaneintrag
-(IBAction)delete {
    
    [dbConnect openDb];
    if([dbConnect deleteStEintrag:eintrag.vId]) {
    }
    [dbConnect closeDb];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    dbConnect = [[DbConnect alloc] init];
    nameLabel.text = eintrag.name;
    blockLabel.text = eintrag.block;
    vIDLabel.text = eintrag.ort;
    
    // versteckt Knöpfe, wenn kein Eintrag vorhanden ist
    deleteButton.hidden = [eintrag.vId isEqualToString:@""];
    anzeigenButton.hidden = [eintrag.vId isEqualToString:@""];
    hinzuButton.hidden = [eintrag.vId isEqualToString:@""];
    
    // zeigt entweder Eintrag bearbeiten oder erstellen an
    erstellenButton.hidden = ![eintrag.vId isEqualToString:@""];
    bearbeitenButton.hidden = [eintrag.vId isEqualToString:@""];
    
    // versteckt Knopf zum Anzeigen der Hausaufgabe
    // wenn keine Hausaufgaben vorliegen
    //
    anzeigenButton.hidden = [hausaufgabenArray count] == 0;
    
    dbConnect = [[DbConnect alloc] init];
    hausaufgabenArray = [[NSMutableArray alloc] init];
    
    
    // holt die Hausaufgabendaten aus der Datenbank
    // aber nur die von der Veranstaltung
    [dbConnect openDb];
    
    NSMutableArray *aufgabeArray = [dbConnect getHAufgabeWithID:eintrag.vId];
    NSMutableArray *beschreibungArray = [dbConnect getHBeschreibungWithID:eintrag.vId];
    NSMutableArray *datumArray = [dbConnect getHDatumWithID:eintrag.vId];
    NSMutableArray *priorityArray = [dbConnect getHPriorityWithID:eintrag.vId];
    NSMutableArray *idArray = [dbConnect getHIDWithID:eintrag.vId];
    NSMutableArray *veranstaltungArray = [dbConnect getHVeranstWithID:eintrag.vId];
    
    
    [dbConnect closeDb];
    
    // erstellt Hausaufgaben und packt sie in eine Liste
    for(int i = 0; i < [aufgabeArray count]; i++) {
        Hausaufgaben *hausaufgabe = [[Hausaufgaben alloc] init];
        hausaufgabe.aufgabe = [aufgabeArray objectAtIndex:i];
        hausaufgabe.beschreibung = [beschreibungArray objectAtIndex:i];
        hausaufgabe.datum = [datumArray objectAtIndex:i];
        hausaufgabe.priority = [priorityArray objectAtIndex:i];
        hausaufgabe.ID = [idArray objectAtIndex:i];
        hausaufgabe.veranstaltung = [veranstaltungArray objectAtIndex:i];
        [hausaufgabenArray addObject:hausaufgabe];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    // übergibt ein Hausaufgabenobjekt zum Erstellen
    if ([[segue identifier] isEqualToString:@"hinzu"]) {
        HAeditViewController *hinzuController =
        [segue destinationViewController];
        Hausaufgaben *hausaufgabe = [[Hausaufgaben alloc] init];
        hausaufgabe.veranstaltung = eintrag.name;
        hausaufgabe.veranstaltungID = eintrag.vId;
        hausaufgabe.priority = @"1";
        hinzuController.hausaufgabe  = hausaufgabe;
        hinzuController.isEdit = NO;
        hinzuController.navigationItem.title = @"Hinzufügen";
    }
    
    // übergibt die Hausaufgabenliste zum Anzeigen
    if ([[segue identifier] isEqualToString:@"haListe"]) {
        ToDoListViewController *toDoController =
        [segue destinationViewController];
        
        // hier wird die Hausaufgabenliste der Veranstaltung übergeben
        toDoController.hausaufgabenArray = hausaufgabenArray;

    }
    
    if ([[segue identifier] isEqualToString:@"erstellen"]) {
        STErstellenViewController *stErstellenController =
        [segue destinationViewController];
        
        stErstellenController.eintrag = eintrag;
        stErstellenController.isEdit = NO;
        stErstellenController.navigationItem.title = @"Eintrag erstellen";
        
    }
    
    if ([[segue identifier] isEqualToString:@"bearbeiten"]) {
        STErstellenViewController *stErstellenController =
        [segue destinationViewController];
        
        stErstellenController.eintrag = eintrag;
        stErstellenController.isEdit = YES;
        stErstellenController.navigationItem.title = @"Eintrag bearbeiten";
        
    }
    
}


@end
