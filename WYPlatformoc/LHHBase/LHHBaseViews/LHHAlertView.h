//
//  LHHAlertView.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/8.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface LHHAlertView : NSObject

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) NSString *message;

- (id)initWithView:(UIView *)view;
- (id)initWithView:(UIView *)view message:(NSString *)message;
- (void)show:(BOOL)animated;
- (void)hide:(BOOL)animated;
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay;

@end
