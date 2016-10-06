//
//  ViewController.m
//  hello
//
//  Created by 管西京 on 12-9-17.
//  Copyright (c) 2012年 apple. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize userOutput;
@synthesize userInput;

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
    self.userInput = nil;
    self.userOutput = nil;
    [self setUserOutput:nil];
    [self setUserInput:nil];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)setOutput:(id)sender {
    //    [[self userOutput]setText:[[self userInput] text]];
    self.userOutput.text=self.userInput.text;
}

@end

