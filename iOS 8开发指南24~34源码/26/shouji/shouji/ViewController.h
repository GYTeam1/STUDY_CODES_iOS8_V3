//
//  ViewController.h
//  shouji


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *resultsView;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;

- (IBAction)storeResults:(id)sender;
- (IBAction)showResults:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
@end

