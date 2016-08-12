//
//  LHHAppDelegate.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/3.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHAppDelegate.h"

#import "LHHMainViewController.h"
#import "LHHLoginViewController.h"

#import "LHHChatsViewController.h"
#import "LHHContactsViewController.h"
#import "LHHDiscoverViewController.h"
#import "LHHMeViewController.h"
#import "LHHTabBarViewController.h"

#import "LHHReachability.h"
#import "LHHUserPreferences.h"

@interface LHHAppDelegate () <UITabBarControllerDelegate>

@end

@implementation LHHAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //    LHHMainViewController *mainViewController = [[LHHMainViewController alloc] init];
//    LHHLoginViewController *loginViewController = [[LHHLoginViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginViewController];
//    UITabBarController *tabBarController = [self setupWeChatViewControllers];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//    self.window.rootViewController = tabBarController;
    [self initRootViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [[LHHReachability sharedInstance] stopMonifier];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[LHHReachability sharedInstance] startMonifier];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initRootViewController {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoWechatViewController) name:kLHHGotoWechatViewController object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoLoginViewController) name:kLHHGotoLoginViewController object:nil];
    if ([LHHUserPreferences sharedInstance].isLogin) {
        [self gotoWechatViewController];
    } else {
        [self gotoLoginViewController];
    }
}

- (void)gotoLoginViewController {
    [LHHBaseViewController customizeLoginBars];
    
    LHHLoginViewController *loginViewController = [[LHHLoginViewController alloc] init];
    loginViewController.gotoLoginType = LHHGotoLoginTypeWeChat;
//    @weakify(self);
//    loginViewController.completeBlock = ^ {
//        @strongify(self);
//        [self gotoWechatViewController];
//    };
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    self.window.rootViewController = loginNav;
    
    self.tabIndex = -1;
    self.tabBarController = nil;
    self.currentNav = nil;
}

- (void)gotoWechatViewController {
    [LHHBaseViewController customizeBars];
    
    UITabBarController *tabBarController = [self setupWeChatViewControllers];
    self.window.rootViewController = tabBarController;
}

- (UITabBarController *)setupWeChatViewControllers {
    LHHChatsViewController *chatsViewController = [[LHHChatsViewController alloc] init];
    UINavigationController *chatsNaviController = [[UINavigationController alloc] initWithRootViewController:chatsViewController];
    
    LHHContactsViewController *contactsViewController = [[LHHContactsViewController alloc] init];
    UINavigationController *contactsNaviController = [[UINavigationController alloc] initWithRootViewController:contactsViewController];
    
    LHHDiscoverViewController *discoverViewController = [[LHHDiscoverViewController alloc] init];
    UINavigationController *discoverNaviController = [[UINavigationController alloc] initWithRootViewController:discoverViewController];
    
    LHHMeViewController *meViewController = [[LHHMeViewController alloc] init];
    UINavigationController *meNaviController = [[UINavigationController alloc] initWithRootViewController:meViewController];
    
    LHHTabBarItem *itemForChats = [[LHHTabBarItem alloc] initWithTitle:@"1"
                                                         selectedImage:[UIImage imageNamed:@"tabbar_item_chats_hl"]
                                                       unselectedImage:[UIImage imageNamed:@"tabbar_item_chats"]];
    
    LHHTabBarItem *itemForContacts = [[LHHTabBarItem alloc] initWithTitle:@"2"
                                                         selectedImage:[UIImage imageNamed:@"tabbar_item_contacts_hl"]
                                                       unselectedImage:[UIImage imageNamed:@"tabbar_item_contacts"]];
    
    LHHTabBarItem *itemForDiscover = [[LHHTabBarItem alloc] initWithTitle:@"3"
                                                         selectedImage:[UIImage imageNamed:@"tabbar_item_discover_hl"]
                                                       unselectedImage:[UIImage imageNamed:@"tabbar_item_discover"]];
    
    LHHTabBarItem *itemForMe = [[LHHTabBarItem alloc] initWithTitle:@"4"
                                                         selectedImage:[UIImage imageNamed:@"tabbar_item_me_hl"]
                                                       unselectedImage:[UIImage imageNamed:@"tabbar_item_me"]];
    
    LHHTabBarViewController *tabBarViewController = [[LHHTabBarViewController alloc] init];
    tabBarViewController.tabBarItems = @[itemForChats, itemForContacts, itemForDiscover, itemForMe];
    tabBarViewController.viewControllers = @[chatsNaviController, contactsNaviController, discoverNaviController, meNaviController];
    tabBarViewController.delegate = self;
    self.tabIndex = 0;
    self.tabBarController = tabBarViewController;
    self.currentNav = chatsNaviController;
    return tabBarViewController;
}

#pragma mark -
#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSArray *array = tabBarController.viewControllers;
    NSInteger idx = [array indexOfObject:viewController];
    self.currentNav = array[idx];
    [self.currentNav popToRootViewControllerAnimated:NO];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSArray *array = tabBarController.viewControllers;
    _tabIndex = [array indexOfObject:viewController];
}

@end
