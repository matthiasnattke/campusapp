//
// MensaViewController-old.h

#import <UIKit/UIKit.h>
#import "Produkt.h"

@interface MensaViewController-old : UIViewController {

   	IBOutlet UILabel *Essen1;
   	IBOutlet UILabel *Essen2;
   	IBOutlet UILabel *Essen3;
   	IBOutlet UILabel *Essen4;
   	IBOutlet UILabel *Sonderbar;
    IBOutlet UILabel *Sonderbarbeschr;
    
	IBOutlet UILabel *TitelText;
	IBOutlet UILabel *Kurzbeschreibung;
    IBOutlet UILabel *Kategorie;
	Tagesmenu *myProdukt;
    IBOutlet UIScrollView *scroll;
}

@property (nonatomic, retain) UILabel *Essen1;
@property (nonatomic, retain) UILabel *Essen2;
@property (nonatomic, retain) UILabel *Essen3;
@property (nonatomic, retain) UILabel *Essen4;
@property (nonatomic, retain) UILabel *Sonderbar;
@property (nonatomic, retain) UILabel *Sonderbarbeschr;

@property (nonatomic, retain) UILabel *TitelText;
@property (nonatomic, retain) UILabel *Kurzbeschreibung;
@property (nonatomic, retain) UILabel *Kategorie;
@property (nonatomic, retain) Tagesmenu *myProdukt;

@end


