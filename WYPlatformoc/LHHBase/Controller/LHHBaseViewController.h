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
@property (nonatomic, strong) NSString *leftTitle;
@property (nonatomic, strong) NSString *navTitle;

- (void)dismiss;
- (void)setWaiting:(BOOL)waiting title:(NSString *)title;
- (void)setWYTitle:(NSString *)title;
- (void)buildNavigationBar;
- (void)checkLogin:(void(^)(void))block;
- (void)checkNetWorkSuccessBlock:(void(^)())success errorBlock:(void(^)())error;

+ (void)customizeDefaultBars;
+ (void)customizeBars;
+ (void)customizeSearchBars;

- (void)navigationLeftBack:(NSString *)title;
- (void)pushViewControllerWith:(NSString *)className leftTitle:(NSString *)leftTitle navTitle:(NSString *)navTitle;
// controller从下往上出现
- (void)pushViewController:(UIViewController *)viewController;
// controller从上往下消失
- (void)popViewController;

@end
