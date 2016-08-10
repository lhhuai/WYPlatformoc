//
//  LHHBaseViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseViewController.h"
#import "LHHLoginViewController.h"
#import "LHHBarButtonItem.h"
#import "UIImage+WYAddition.h"
#import "UIColor+WYAddition.h"
#import "LHHUserPreferences.h"

@interface LHHBaseViewController ()

@end

@implementation LHHBaseViewController

- (id)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss {
    [self.navigationController popViewControllerAnimated:YES];
}

// 设置页面Title
- (void)setWYTitle:(NSString *)title {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, WY_SIZE(180), PHONE_NAVIGATIONBAR_HEIGHT);
    label.backgroundColor = [UIColor clearColor];
    label.font = WY_FONT(17);
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    self.navigationItem.titleView = label;
}

- (void)buildNavigationBar {
//    UIImage *gradientImage44 = [UIImage wy_imageWithColor:[UIColor wy_colorWithRed:56 green:55 blue:60] size:CGSizeMake(1, 1) opaque:.8];
//    UIImage *gradientImage32 = [UIImage wy_imageWithColor:[UIColor wy_colorWithRed:56 green:55 blue:60] size:CGSizeMake(1, 1) opaque:.8];
//    
//    //customize the appearance of UINavigationBar
//    [self.navigationController.navigationBar setBackgroundImage:gradientImage44 forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:gradientImage32 forBarMetrics:UIBarMetricsCompact];
//    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor wy_colorWithRed:56 green:55 blue:60]];
}

- (void)checkLogin:(void(^)(void))block {
    if ([LHHUserPreferences sharedInstance].isLogin) {
        block();
    } else {
        LHHLoginViewController *loginVC = [[LHHLoginViewController alloc] init];
        loginVC.completeBlock = block;
        UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:loginNav animated:YES completion:nil];
    }
}

+ (void)customizeBars {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setBarTintColor:[UIColor wy_colorWithRed:56 green:55 blue:60]];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

- (void)barBack {
    [self dismiss];
}

- (void)dealloc {
    NSLog(@"<%@>%@ %@", NSStringFromClass(self.class), self.title, NSStringFromSelector(_cmd));
}

@end
