//
//  LHHTabBarViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHTabBarViewController.h"

@interface LHHTabBarViewController ()

@end

@implementation LHHTabBarViewController

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    if ([viewControllers count] != [self.tabBarItems count] || [viewControllers count] == 0) {
        NSAssert(NO, @"%s", __FUNCTION__);
    }
    int i = 0;
    for (UIViewController *viewController in viewControllers) {
        UITabBarItem *tabBarItem = [self buildTabBarItem:self.tabBarItems[i]];
        viewController.tabBarItem = tabBarItem;
        i++;
    }
    [super setViewControllers:viewControllers];
}

- (UITabBarItem *)buildTabBarItem:(LHHTabBarItem *)item {
    return [[UITabBarItem alloc] initWithTitle:item.title
                                         image:[item.unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                 selectedImage:[item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
}

@end
