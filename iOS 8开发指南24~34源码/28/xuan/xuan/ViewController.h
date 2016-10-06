//
//  ViewController.h


#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *colorView;
@property (strong, nonatomic) IBOutlet UISwitch *toggleAccelerometer;
@property (strong, nonatomic) IBOutlet UISwitch *toggleGyroscope;
@property (strong, nonatomic) CMMotionManager *motionManager;

- (IBAction)controlHardware:(id)sender;
- (void)doAcceleration:(CMAcceleration)acceleration;
- (void)doRotation:(CMRotationRate)rotation;

@end
