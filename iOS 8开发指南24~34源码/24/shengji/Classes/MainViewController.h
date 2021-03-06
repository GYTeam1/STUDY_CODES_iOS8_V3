//
//  MainViewController.h
//  WhereAmI


#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <CoreLocation/CLLocationManagerDelegate.h> 

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate,CLLocationManagerDelegate> {
	IBOutlet UITextField *altitude;
    IBOutlet UITextField *latitude;
    IBOutlet UITextField *longitude;
	
	CLLocationManager   *locmanager; 
	BOOL                wasFound;
}

@property (nonatomic,retain) UITextField *altitude;
@property (nonatomic,retain) UITextField *latitude;
@property (nonatomic,retain) UITextField *longitude;
@property (nonatomic,retain) CLLocationManager  *locmanager; 

- (IBAction)showInfo:(id)sender;

- (IBAction)update;

- (IBAction)openWebMap;

@end
