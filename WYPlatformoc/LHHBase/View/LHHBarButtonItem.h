//
//  LHHBarButtonItem.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/7.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHHBarButtonItemDelegate <NSObject>

@optional
- (void)barBack;

@end

@interface LHHBarButtonItem : UIView

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)backBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
