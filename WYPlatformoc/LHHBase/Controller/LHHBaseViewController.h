//
//  LHHBaseViewController.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHBarButtonItem.h"
#import "LHHAlertView.h"

@interface LHHBaseViewController : UIViewController <LHHBarButtonItemDelegate>

//@property (nonatomic, strong) LHHAlertView *hud;

- (void)dismiss;
- (void)setWYTitle:(NSString *)title;
- (void)buildNavigationBar;
- (void)checkLogin:(void(^)(void))block;

+ (void)customizeLoginBars;
+ (void)customizeBars;

// controller从下往上出现
- (void)pushViewController:(UIViewController *)viewController;
// controller从上往下消失
- (void)popViewController;

@end
