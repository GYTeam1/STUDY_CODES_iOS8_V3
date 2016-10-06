

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize mainView,redViewController,blueViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    mainView = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
    // View的背景设置为白色
    mainView.backgroundColor = [UIColor whiteColor];
    
    RedViewController *redView = [[RedViewController alloc] init];
    self.redViewController = redView;
    
    UIToolbar *myToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    NSMutableArray *btnArray = [[NSMutableArray alloc] init];
    [btnArray addObject:[[UIBarButtonItem alloc] initWithTitle:@"Switch" style:UIBarButtonItemStyleDone target:self action:@selector(onClickSwitch:)]];
    [myToolbar setItems:btnArray];
    
    [mainView insertSubview:self.redViewController.view atIndex:0];
    [mainView addSubview:myToolbar];
    self.view = mainView;
}

- (void)onClickSwitch: (id *) sender
{
    if (self.blueViewController.view.superview == nil)
    {
        if (self.blueViewController == nil)
        {
            self.blueViewController = [[[BlueViewController alloc] init] autorelease];
        }
        [self.redViewController.view removeFromSuperview];
        [mainView insertSubview:self.blueViewController.view atIndex:0];
    }
    else
    {
        if (self.redViewController == nil)
        {
            self.redViewController = [[[RedViewController alloc] init] autorelease];
        }
        [self.blueViewController.view removeFromSuperview];
        [mainView insertSubview:self.redViewController.view atIndex:0];
    }
}

- (void)dealloc
{
    [blueViewController release];
    [redViewController release];
    [mainView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
