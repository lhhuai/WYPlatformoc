//
//  LHHBaseViewController+Navigation.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/11.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseViewController+Navigation.h"

@implementation LHHBaseViewController (Navigation)

// 设置页面Title
- (void)setLHHTitle:(NSString *)title {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, WY_SIZE(180), PHONE_NAVIGATIONBAR_HEIGHT);
    label.backgroundColor = [UIColor clearColor];
    label.font = WY_FONT_TITLE;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    self.navigationItem.titleView = label;
}

// controller从下往上出现
- (void)wy_pushViewController:(UIViewController *)viewController {
    CATransition *transition = [CATransition animation];
    transition.duration = .3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
//    LHHRegistViewController *registVC = [[LHHRegistViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:NO];
}

// controller从上往下消失
- (void)wy_popViewController {
    CATransition *transition = [CATransition animation];
    transition.duration = .3;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

@end
