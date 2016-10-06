

#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong,nonatomic) UIActivityIndicatorView *activityIndicatorView;

- (IBAction)buttonPressed:(id)sender;

-(void)loadWebPageWithString:(NSString *)urlString;
@end
















