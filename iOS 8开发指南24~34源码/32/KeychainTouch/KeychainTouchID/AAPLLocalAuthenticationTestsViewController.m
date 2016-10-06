/*
Copyright (C) 2014 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:

 Implements LocalAuthenticaion framework demo
 
*/


#import "AAPLLocalAuthenticationTestsViewController.h"

@import LocalAuthentication;


@interface AAPLLocalAuthenticationTestsViewController ()

@end

@implementation AAPLLocalAuthenticationTestsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // prepare the actions whch ca be tested in this class
    self.tests = @[
               [[AAPLTest alloc] initWithName:NSLocalizedString(@"TOUCH_ID_PREFLIGHT", nil) details:@"Using canEvaluatePolicy:" selector:@selector(canEvaluatePolicy)],
               [[AAPLTest alloc] initWithName:NSLocalizedString(@"TOUCH_ID", nil) details:@"Using evaluatePolicy:" selector:@selector(evaluatePolicy)]
               ];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textView scrollRangeToVisible:NSMakeRange([_textView.text length], 0)];
}

-(void)viewDidLayoutSubviews
{
    // 只需要设置适当大小的基于内容的表观
    CGFloat height = MIN(self.view.bounds.size.height, self.tableView.contentSize.height);
    self.dynamicViewHeight.constant = height;
    [self.view layoutIfNeeded];
}

#pragma mark - Tests

- (void)canEvaluatePolicy
{
    LAContext *context = [[LAContext alloc] init];
    __block  NSString *msg;
    NSError *error;
    BOOL success;
    
    // 演示如何使用可用和可注册的Touch ID
    success = [context canEvaluatePolicy: LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    if (success) {
        msg =[NSString stringWithFormat:NSLocalizedString(@"TOUCH_ID_IS_AVAILABLE", nil)];
    } else {
        msg =[NSString stringWithFormat:NSLocalizedString(@"TOUCH_ID_IS_NOT_AVAILABLE", nil)];
    }
    [super printResult:self.textView message:msg];
    
}

- (void)evaluatePolicy
{
    LAContext *context = [[LAContext alloc] init];
    __block  NSString *msg;
    
    // 显示authentication UI验证界面
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:NSLocalizedString(@"UNLOCK_ACCESS_TO_LOCKED_FATURE", nil) reply:
     ^(BOOL success, NSError *authenticationError) {
         if (success) {
             msg =[NSString stringWithFormat:NSLocalizedString(@"EVALUATE_POLICY_SUCCESS", nil)];
         } else {
             msg = [NSString stringWithFormat:NSLocalizedString(@"EVALUATE_POLICY_WITH_ERROR", nil), authenticationError.localizedDescription];
         }
         [self printResult:self.textView message:msg];
     }];
    
}

@end
