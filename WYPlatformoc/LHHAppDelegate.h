//
//  LHHAppDelegate.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/3.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHHTabBarViewController;

@interface LHHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) NSUInteger tabIndex;
@property (nonatomic, strong) UINavigationController *currentNav;
@property (nonatomic, strong) LHHTabBarViewController *tabBarController;

@end

