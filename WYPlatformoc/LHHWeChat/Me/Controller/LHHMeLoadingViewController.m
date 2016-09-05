//
//  LHHMeLoadingViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeLoadingViewController.h"

@interface LHHMeLoadingViewController ()

@end

@implementation LHHMeLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *startBtn = [[UIButton alloc] initWithFrame:CGRectMake(WY_SIZE(20), WY_SIZE(100), WY_SIZE(70), WY_SIZE(24))];
    [startBtn setTitle:@"start" forState:UIControlStateNormal];
    [startBtn setTitleColor:RGBCOLOR(0, 183, 0) forState:UIControlStateNormal];
    startBtn.titleLabel.font = WY_FONT_16;
    [startBtn addTarget:self action:@selector(startAnimating) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *stopBtn = [[UIButton alloc] initWithFrame:CGRectMake(WY_SIZE(20 + 70 + 40), WY_SIZE(100), WY_SIZE(70), WY_SIZE(24))];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    [stopBtn setTitleColor:RGBCOLOR(0, 183, 0) forState:UIControlStateNormal];
    stopBtn.titleLabel.font = WY_FONT_16;
    [stopBtn addTarget:self action:@selector(stopAnimating) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
}

- (void)startAnimating {
    UIActivityIndicatorView *indicator = nil;
    indicator = (UIActivityIndicatorView *)[self.view viewWithTag:103];
    
    if (indicator == nil) {
        //初始化:
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        indicator.tag = 103;
        //设置显示样式,见UIActivityIndicatorViewStyle的定义
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        //设置背景色
//        indicator.backgroundColor = [UIColor blackColor];
        //设置背景透明
        indicator.alpha = 0.5;
        //设置背景为圆角矩形
        indicator.layer.cornerRadius = 6;
        indicator.layer.masksToBounds = YES;
        //设置显示位置
        [indicator setCenter:CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0)];
        //开始显示Loading动画
        [indicator startAnimating];
        [self.view addSubview:indicator];
    }
    
    //开始显示Loading动画
    [indicator startAnimating];
}

- (void)stopAnimating {
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)[self.view viewWithTag:103];
    //停止显示Loading动画
    [indicator stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
