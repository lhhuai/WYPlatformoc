//
//  UIView+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYLineView.h"

@interface UIView (WYAddition)

- (UIImage *)wy_toImage;
- (UIImage *)wy_toImageLegacy;

- (void)wy_fitToShowAllSubviews;
- (void)wy_removeAllSubviews;

- (WYLineView *)wy_addTopLineWithColor:(UIColor *)color;
- (WYLineView *)wy_addLeftLineWithColor:(UIColor *)color;
- (WYLineView *)wy_addBottomLineWithColor:(UIColor *)color;
- (WYLineView *)wy_addRightLineWithColor:(UIColor *)color;

- (void)wy_addTapListener:(void(^)())tapListener;
- (void)wy_addTapListener:(void(^)())tapListener identifier:(NSString *)identifier;
- (void)wy_removeTapListenerWithIdentifier:(NSString *)identifier;

- (UIViewController *)wy_viewController;

@end
