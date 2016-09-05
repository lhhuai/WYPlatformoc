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
#import "LHHBaseViewController+Navigation.h"

@interface LHHBaseViewController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property(nullable, nonatomic, weak) id <UIGestureRecognizerDelegate> gestureRecognizerDelegate;

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
//    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = COLOR_MAIN_BG;
    
    if ([[self.navigationController viewControllers] count] >= 2 && [self.navigationController topViewController] == self) {
        [self navigationLeftBack:self.leftTitle];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navTitle != nil && ![self.navTitle isEqualToString:@""]) {
        [self setWYTitle:self.navTitle];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        // ios7自定义返回按钮后，右滑返回功能失效解决方法
        // 只有在二级页面生效
        if ([self.navigationController.viewControllers count] > 1) {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        } else {
            if  (self.gestureRecognizerDelegate != nil) {
                self.navigationController.interactivePopGestureRecognizer.delegate = self.gestureRecognizerDelegate;
            } else {
                self.gestureRecognizerDelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
            }
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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
    [self wy_setTitle:title];
}

- (void)setWaiting:(BOOL)waiting title:(NSString *)title {
    [self wy_setWaiting:waiting title:title];
}

- (void)navigationLeftBack:(NSString *)title {
    [self wy_navigationLeftBack:title];
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

- (void)checkNetWorkSuccessBlock:(void(^)())success errorBlock:(void(^)())error {
    [self setWaiting:YES title:@"Connecting..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (success) {
            success();
        }
    });
}

+ (void)customizeDefaultBars {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
//    [[UINavigationBar appearance] setHidden:YES];
//    [[UINavigationBar appearance] setTranslucent:YES];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

+ (void)customizeBars {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UINavigationBar appearance] setBarTintColor:[UIColor wy_colorWithRed:56 green:55 blue:60]];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

+ (void)customizeSearchBars {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    [[UINavigationBar appearance] setBarTintColor:COLOR_MAIN_BG];
    [[UINavigationBar appearance] setTranslucent:YES];
    [[UINavigationBar appearance] setTintColor:COLOR_MAIN_BG];
}

- (void)barBack {
    [self dismiss];
}

- (void)pushViewControllerWith:(NSString *)className leftTitle:(NSString *)leftTitle navTitle:(NSString *)navTitle {
    [self wy_pushViewControllerWith:className leftTitle:leftTitle navTitle:navTitle];
}

// controller从下往上出现
- (void)pushViewController:(UIViewController *)viewController {
    [self wy_pushViewController:viewController];
}
// controller从上往下消失
- (void)popViewController {
    [self wy_popViewController];
}

- (void)dealloc {
    NSLog(@"<%@>%@ %@", NSStringFromClass(self.class), self.title, NSStringFromSelector(_cmd));
}

@end
