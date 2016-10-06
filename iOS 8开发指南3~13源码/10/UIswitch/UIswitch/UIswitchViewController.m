//
//  UIswitchViewController.m
//  UIswitch


#import "UIswitchViewController.h"

@interface UIswitchViewController ()

@end

@implementation UIswitchViewController
@synthesize leftSwitch,rightSwitch;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    leftSwitch=[[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    rightSwitch=[[UISwitch alloc] initWithFrame:CGRectMake(0,240, 40, 20)];
    [leftSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:leftSwitch];
    [rightSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:rightSwitch];
	// Do any additional setup after loading the view.
}
- (IBAction)switchChanged:(id)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    BOOL setting = mySwitch.isOn;	//获得开关状态
    if(setting)
    {
       NSLog(@"YES");
    }else {
       NSLog(@"NO");
    }
    [leftSwitch setOn:setting animated:YES];	//设置开关状态
    [rightSwitch setOn:setting animated:YES];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
