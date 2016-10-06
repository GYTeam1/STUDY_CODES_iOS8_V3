

#import "WebViewViewController.h"

@interface WebViewViewController ()

@end

@implementation WebViewViewController
@synthesize textField;
@synthesize webView;
@synthesize button;
@synthesize activityIndicatorView;

- (void)viewDidLoad
{
    [super viewDidLoad];
//自动缩放页面，以适应屏幕
	webView.scalesPageToFit = YES;
    webView.delegate = self;
//    webView.backgroundColor=[UIColor blackColor];
//    webView.alpha=0.6;
    
//    指定进度轮大小
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
//    设置进度轮的中心也可以[self.activityIndicatorView setCenter:CGPointMake(30, 30)];
    [self.activityIndicatorView setCenter:self.view.center];
//  设置activityIndicatorView风格  
    [self.activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.webView addSubview:self.activityIndicatorView];
    [self buttonPressed:nil];
    
    
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setWebView:nil];
    [self setButton:nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)loadWebPageWithString:(NSString *)urlString
{
    if (self.textField.text != nil) {
//        追加一个字符串
        urlString = [@"http://" stringByAppendingFormat:urlString];
        NSURL *url = [NSURL URLWithString:urlString];
//        NSURLRequest类方法用于获取URL
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        webView加载URL
        [webView loadRequest:request];
    }
     
}
//按钮事件，点击按钮开始调用loadWebPageWithString方法
- (IBAction)buttonPressed:(id)sender {
    [textField resignFirstResponder];
    [self loadWebPageWithString:textField.text];
//    点击完button后隐藏textField和button
    if (sender==button) {
        textField.hidden = YES;
        button.hidden = YES;
    }
}
//UIWebView委托方法，开始加载一个url时候调用此方法
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicatorView startAnimating];
}
//UIWebView委托方法，url加载完成的时候调用此方法
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicatorView stopAnimating];
}
//加载url出错的时候调用此方法
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
// 判断button是否被触摸
    if (!self.button ) {
         
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
    
}
@end
