//
//  LHHSearchController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHSearchController.h"
#import "LHHChatsSearchResultsViewController.h"

@interface LHHSearchController ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation LHHSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, PHONE_STATUSBAR_HEIGHT + PHONE_NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    self.bgView.backgroundColor = COLOR_MAIN_BG;
//    [self.view addSubview:self.bgView];
//    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, PHONE_STATUSBAR_HEIGHT + PHONE_NAVIGATIONBAR_HEIGHT, 50, 20)];
//    [btn setTitle:@"btn" forState:UIControlStateNormal];
//    [btn setTitleColor:COLOR_WY_GREEN forState:UIControlStateNormal];
//    btn.backgroundColor = COLOR_WHITE;
//    btn.layer.borderColor = COLOR_WY_GREEN.CGColor;
//    btn.layer.borderWidth = WY_SIZE(1);
//    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
//    [self.bgView addSubview:btn];
//
//    self.definesPresentationContext = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickBtn {
//    LHHChatsSearchResultsViewController *resultVC = [[LHHChatsSearchResultsViewController alloc] init];
//    [self.navigationController pushViewController:resultVC animated:YES];
    LHHChatsSearchResultsViewController *resultVC = [[LHHChatsSearchResultsViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:resultVC];
    [self presentViewController:nav animated:YES completion:NULL];
}

- (void)hideBgView:(BOOL)hidden {
    self.bgView.hidden = hidden;
}

@end
