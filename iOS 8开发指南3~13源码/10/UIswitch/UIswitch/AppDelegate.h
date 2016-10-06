//
//  AppDelegate.h
//  UIswitch


#import <UIKit/UIKit.h>
#import "UIswitchViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIswitchViewController *UIswitchView;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain)UIswitchViewController* UIswitchView;
@end
