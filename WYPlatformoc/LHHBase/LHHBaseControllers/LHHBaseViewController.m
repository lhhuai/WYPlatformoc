//
//  LHHBaseViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseViewController.h"
#import "LHHBarButtonItem.h"

@interface LHHBaseViewController ()

@end

@implementation LHHBaseViewController

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

- (void)barBack {
    [self dismiss];
}

- (void)dealloc {
    NSLog(@"<%@>%@ %@", NSStringFromClass(self.class), self.title, NSStringFromSelector(_cmd));
}

@end
