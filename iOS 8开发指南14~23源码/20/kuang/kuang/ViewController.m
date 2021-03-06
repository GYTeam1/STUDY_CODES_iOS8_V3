//
//  ViewController.m
//  kuang


#import "ViewController.h"

@implementation ViewController
@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize viewLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setButtonOne:nil];
    [self setButtonTwo:nil];
    [self setViewLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

-(void)willRotateToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                               duration:(NSTimeInterval)duration {
	
	[super willRotateToInterfaceOrientation:toInterfaceOrientation
								   duration:duration];
	
	if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight ||
		toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
		self.viewLabel.frame=CGRectMake(175.0,140.0,130.0,20.0);
		self.buttonOne.frame=CGRectMake(20.0,20.0,440.0,100.0);
		self.buttonTwo.frame=CGRectMake(20.0,180.0,440.0,100.0);
	} else {
		self.viewLabel.frame=CGRectMake(95.0,15.0,130.0,20.0);
		self.buttonOne.frame=CGRectMake(20.0,50.0,280.0,190.0);
		self.buttonTwo.frame=CGRectMake(20.0,250.0,280.0,190.0);
	}
}


@end
