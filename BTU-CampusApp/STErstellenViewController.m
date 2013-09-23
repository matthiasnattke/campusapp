//
//  STErstellenViewController.m
//  BTU-CampusApp
//
//  Created by Admin on 06.02.13.
//  Copyright (c) 2013 JMMMT. All rights reserved.
//

#import "STErstellenViewController.h"
#import "DbConnect.h"

@interface STErstellenViewController ()

@end

@implementation STErstellenViewController

@synthesize eintrag, aufgabeField, datumField, deleteButton, isEdit, dbConnect;

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



// speichert den Eintrag
// Entweder wird Eintrag bearbeitet oder hinzugefügt
//
-(IBAction)speichern {
    //Eintrag bekommt neue Daten
    eintrag.name = aufgabeField.text;
    eintrag.ort = datumField.text;
    
    [dbConnect openDb];
    // Entscheidend, ob die Hausaufgabe bearbeitet wurde
    // oder neu hinzugefügt wurde
    //
    if(isEdit) {
        [dbConnect saveStEintrag:eintrag];
    }
    else {
        NSDate *date = [[NSDate alloc] init];
        NSString *dateString = date.description;
        eintrag.vId = dateString;
        NSLog([NSString stringWithFormat:@"%@ %@ %@ %@ %@", eintrag.vId, eintrag.name, eintrag.block, eintrag.ort, eintrag.tag]);
        [dbConnect saveStEintrag:eintrag];
        isEdit = YES; // wurde hinzugefügt und wird nur noch bearbeitet
        
    }
    
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
    aufgabeField.text = eintrag.name;
    datumField.text = eintrag.ort;

    
    
    
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


@end
