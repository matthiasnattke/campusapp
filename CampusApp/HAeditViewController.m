//
//  HAeditViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "HAeditViewController.h"
#import "DbConnect.h"
#import "StEintragViewController.h"

@interface HAeditViewController ()

@end

@implementation HAeditViewController

@synthesize hausaufgabe, veranstaltungLabel,aufgabeField, datumField, beschreibungField,deleteButton, isEdit, dbConnect, prioSeg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// schließt die Tastatur, wenn man auf "return" klickt
-(IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

// legt die Priorität der Hausaufgabe fest
-(IBAction)prioChanged {
    int priority = self.prioSeg.selectedSegmentIndex; //repräsentiert die Priorität
    NSString *prString = [NSString stringWithFormat:@"%i",priority]; // Zahl als Zeichen
    hausaufgabe.priority = prString;
}

// speichert die Hausaufgabe
// Entweder wird die Hausaufgabe bearbeitet oder hinzugefügt
//
-(IBAction)speichern {
    //Hausaufgabe bekommt neue Daten
    hausaufgabe.aufgabe = aufgabeField.text;
    hausaufgabe.beschreibung = beschreibungField.text;
    hausaufgabe.veranstaltung = veranstaltungLabel.text;
    hausaufgabe.datum = datumField.text;
    
    [dbConnect openDb];
    // Entscheidend, ob die Hausaufgabe bearbeitet wurde
    // oder neu hinzugefügt wurde
    //
    if(isEdit) {
        [dbConnect updateHausaufgaben:hausaufgabe];
    }
    else {
        [dbConnect saveHausaufgaben:hausaufgabe];
        isEdit = YES; // wurde hinzugefügt und wird nur noch bearbeitet
        
    }
    
    [dbConnect closeDb];
}

// löscht die aktuelle Hausaufgabe
-(IBAction)loeschen {
    [dbConnect openDb];
    [dbConnect deleteHausaufgaben:hausaufgabe];
    [dbConnect closeDb];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:NO];
    
    // Daten der Hausaufgabe werden angezeigt
    dbConnect = [[DbConnect alloc] init];
    veranstaltungLabel.text = hausaufgabe.veranstaltung;
    aufgabeField.text = hausaufgabe.aufgabe;
    beschreibungField.text = hausaufgabe.beschreibung;
    datumField.text = hausaufgabe.datum;
    prioSeg.selectedSegmentIndex = [hausaufgabe.priority intValue];
    

    
    // Versteckt den Knopf, falls es sich nicht um die Editierung handelt
    deleteButton.hidden = !isEdit;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (datumField) {
        if ([datumField canResignFirstResponder]) [datumField resignFirstResponder];
    }
    [super touchesBegan: touches withEvent:event];
}
*/

// hier wird die Veranstaltung aus dem Stundenplan mit der aktuellen
// Hausaufgabeverknüpft
//
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"zurListe"])
    {
        StEintragViewController *eintragController =
        [segue destinationViewController];
        eintragController.editController = [segue sourceViewController];
    }
    
    
}

@end
