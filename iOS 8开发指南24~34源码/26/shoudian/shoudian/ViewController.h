//
//  ViewController.h
//  shoudian


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (strong, nonatomic) IBOutlet UISlider *brightnessSlider;
@property (strong, nonatomic) IBOutlet UIView *lightSource;

- (IBAction)setLightSourceAlphaValue:(id)sender;

@end
