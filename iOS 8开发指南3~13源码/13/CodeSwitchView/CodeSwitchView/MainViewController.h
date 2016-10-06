

#import <UIKit/UIKit.h>
#import "RedViewController.h"
#import "BlueViewController.h"


@interface MainViewController : UIViewController

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) RedViewController *redViewController;
@property (strong, nonatomic) BlueViewController *blueViewController;

@end
