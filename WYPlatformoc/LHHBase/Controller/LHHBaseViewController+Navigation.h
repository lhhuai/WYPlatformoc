//
//  LHHBaseViewController+Navigation.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/11.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseViewController.h"

@interface LHHBaseViewController (Navigation)

- (void)setLHHTitle:(NSString *)title;
// controller从下往上出现
- (void)wy_pushViewController:(UIViewController *)viewController;
// controller从上往下消失
- (void)wy_popViewController;

@end
