//
//  LVSearchViewController.m
//  BTU-CampusApp
//
//  Created by JMMMT 2013
//

#import "LVSearchViewController.h"
#import "DbConnect.h"
#import "Abschluss.h"
#import "Semester.h"
#import "Studiengang.h"
#import "Lehrveranstaltung.h"

@interface LVSearchViewController ()

@end

@implementation LVSearchViewController

@synthesize dbConnect, name, abschlussSlider, abschlussLabel, semesterSlider, semesterLabel, studiengangSlider, studiengangLabel, abschlussListe, semesterListe, studiengangListe, vonSlider, bisSlider, vonLabel, bisLabel, abschluss, semester, studiengang, von, bis, urlWithParameter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction) sliderAbschlussChanged:(UISlider*)sender {
    int index = (int) [sender value];
    abschluss = [abschlussListe objectAtIndex:index];
    abschlussLabel.text  = abschluss.name;
}

-(IBAction) sliderSemesterChanged:(UISlider*)sender {
    int index = (int) [sender value];
    semester = [semesterListe objectAtIndex:index];
    semesterLabel.text  = semester.name;
}

-(IBAction) sliderStudiengangChanged:(UISlider*)sender {
    int index = (int) [sender value];
    studiengang = [studiengangListe objectAtIndex:index];
    studiengangLabel.text  = studiengang.name;
}

-(IBAction) sliderVonChanged:(UISlider*)sender {
    int index = (int) [sender value];
    vonLabel.text  = [NSString stringWithFormat:@"%i", index];
    von = vonLabel.text;
}

-(IBAction) sliderBisChanged:(UISlider*)sender {
    int index = (int) [sender value];
    bisLabel.text  = [NSString stringWithFormat:@"%i", index];
    bis = bisLabel.text;
}



-(IBAction)search {
    [name resignFirstResponder];
    if([name.text isEqualToString:@""]) {
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:@"Geben Sie den Namen der Lehrveranstaltung ein" message:@"Achten Sie auf Groß- und Kleinschreibung" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        
        urlWithParameter = [NSString stringWithFormat:@"http://www.zv.tu-cottbus.de/LSFveranst/LSF4?Semester=%@&Abschluss=%@&Studiengang=%@&Von=%@&Bis=%@",semester.parameter, abschluss.parameter, studiengang.parameter,von,bis];

    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    dbConnect = [[DbConnect alloc] init];
    [dbConnect openDb];
    NSMutableArray *abschlussNames = [dbConnect getAbschlussNames];
    NSMutableArray *abschlussParameters = [dbConnect getAbschlussParameters];
    NSMutableArray *semesterNames = [dbConnect getSemesterNames];
    NSMutableArray *semesterParameters = [dbConnect getSemesterParameters];
    NSMutableArray *studiengangNames = [dbConnect getStudiengangNames];
    NSMutableArray *studiengangParameters = [dbConnect getStudiengangParameters];
    [dbConnect closeDb];
    
    // Abschlussobjekte erzeugen und in eine Liste packen
    abschlussListe = [[NSMutableArray alloc] init];
    for(int i = 0; i < [abschlussNames count]; i++) {
        abschluss = [[Abschluss alloc] init];
        abschluss.name =[abschlussNames objectAtIndex:i];
        abschluss.parameter =[abschlussParameters objectAtIndex:i];
        
        [abschlussListe addObject:abschluss];
    }

    
    // Semesterobjekte erzeugen und in eine Liste packen
    semesterListe = [[NSMutableArray alloc] init];
    for(int i = 0; i < [semesterNames count]; i++) {
        semester = [[Semester alloc] init];
        semester.name =[semesterNames objectAtIndex:i];
        semester.parameter =[semesterParameters objectAtIndex:i];
        
        [semesterListe addObject:semester];
    }
    
    // Studiengangobjekte erzeugen und in eine Liste packen
    studiengangListe = [[NSMutableArray alloc] init];
    for(int i = 0; i < [studiengangNames count]; i++) {
        studiengang = [[Studiengang alloc] init];
        studiengang.name =[studiengangNames objectAtIndex:i];
        studiengang.parameter =[studiengangParameters objectAtIndex:i];
        
        [studiengangListe addObject:studiengang];
    }
    
    //hier wird der Startwert der Slider beim Aufruf übergeben
    int index = (int) abschlussSlider.value;
    abschluss = [abschlussListe objectAtIndex:index];
    abschlussLabel.text  = abschluss.name;
    
    index = (int) semesterSlider.value;
    semester = [semesterListe objectAtIndex:index];
    semesterLabel.text  = semester.name;
    
    index = (int) studiengangSlider.value;
    studiengang = [studiengangListe objectAtIndex:index];
    studiengangLabel.text  = studiengang.name;
    
    index = (int) vonSlider.value;
    vonLabel.text  = [NSString stringWithFormat:@"%i", index];
    von = vonLabel.text;
    
    index = (int) bisSlider.value;
    bisLabel.text  = [NSString stringWithFormat:@"%i", index];
    bis = bisLabel.text;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (name) {
        if ([name canResignFirstResponder]) [name resignFirstResponder];
    }
    [super touchesBegan: touches withEvent:event];
}

@end
