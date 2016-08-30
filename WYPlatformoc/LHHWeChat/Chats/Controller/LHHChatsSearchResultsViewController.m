//
//  LHHChatsSearchResultsViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/18.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHChatsSearchResultsViewController.h"

@interface LHHChatsSearchResultsViewController ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation LHHChatsSearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setWYTitle:@"result"];
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, PHONE_STATUSBAR_HEIGHT + PHONE_NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.bgView.backgroundColor = COLOR_MAIN_BG;
    [self.view addSubview:self.bgView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, PHONE_STATUSBAR_HEIGHT + PHONE_NAVIGATIONBAR_HEIGHT, 50, 20)];
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [btn setTitleColor:COLOR_WY_GREEN forState:UIControlStateNormal];
    btn.backgroundColor = COLOR_WHITE;
    btn.layer.borderColor = COLOR_WY_GREEN.CGColor;
    btn.layer.borderWidth = WY_SIZE(1);
//    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
