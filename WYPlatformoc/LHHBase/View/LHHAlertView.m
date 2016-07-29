//
//  LHHAlertView.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/8.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHAlertView.h"

@implementation LHHAlertView

- (id)initWithView:(UIView *)view{
    self.hud = [[MBProgressHUD alloc] initWithView:view];
    self.hud.opacity = 0.7;
    return self;
}

- (id)initWithView:(UIView *)view message:(NSString *)message {
    if (!message) {
        message = @"Please wait...";
    }
    self.message = message;
    self.hud = [[MBProgressHUD alloc] initWithView:view];
    self.hud.opacity = 0.7;
    return self;
}

- (void)show:(BOOL)animated {
    self.hud.labelText = self.message;
    self.hud.labelFont = [UIFont systemFontOfSize:13];
    [self.hud show:animated];
}

- (void)hide:(BOOL)animated {
    [self.hud hide:animated];
}

- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    [self.hud hide:animated afterDelay:delay];
}

- (void)dealloc {
    self.hud = nil;
}

@end
