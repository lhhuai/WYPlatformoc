//
//  LHHBaseViewController+Navigation.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/11.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseViewController+Navigation.h"
#import "LHHBarButtonItem.h"

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

- (void)wy_navigationLeftBack {
    [self wy_navigationLeftBack:nil];
}

- (void)wy_navigationLeftBack:(NSString *)title {
    UIBarButtonItem *nevigativeSpacer = [[UIBarButtonItem alloc]
                                         initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                         target:nil action:nil];
    nevigativeSpacer.width = WY_SIZE(-10);
    // 返回按钮
    [self.navigationItem setLeftBarButtonItems:@[nevigativeSpacer, [LHHBarButtonItem backBarButtonItemWithTitle:title target:self action:@selector(barBack)]]];
//    [self.navigationItem setRightBarButtonItem:nil];
}

- (void)wy_pushViewControllerWith:(NSString *)className leftTitle:(NSString *)leftTitle {
    // 根据字典字段反射出我们想要的类，并初始化控制器
    Class class = NSClassFromString(className);
    LHHBaseViewController *vc = [[class alloc] init];
    vc.leftTitle = leftTitle;
    //    // 获取参数列表，使用枚举的方式，对控制器进行KVC赋值
    //    NSDictionary *parameter = dict[@"propertys"];
    //    [parameter enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    //        if ([[parameter allKeys] containsObject:key]) {
    //            [vc setValue:obj forKey:key];
    //        }
    //    }];
    [self.navigationController pushViewController:vc animated:YES];
    //    // 从字典中获取方法名，并调用对应的方法
    //    SEL selector = NSSelectorFromString(dict[@"method"]);
    //    [vc performSelector:selector];
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
