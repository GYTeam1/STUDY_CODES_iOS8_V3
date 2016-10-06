//
//  ViewController.h
//  hello
//
//  Created by 管西京 on 12-9-17.
//  Copyright (c) 2012年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *userOutput;
@property (strong, nonatomic) IBOutlet UITextField *userInput;

- (IBAction)setOutput:(id)sender;

@end

