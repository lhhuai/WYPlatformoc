//
//  UIView+LHHDraggable.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/5.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LHHDraggable)

/**
 *  Make view draggable.
 *
 *  @param view    Animator reference view, usually is super view.
 *  @param damping Value from 0.0 to 1.0. 0.0 is the least oscillation. default is 0.4.
 */
- (void)makeDraggable;
- (void)makeDraggableInView:(UIView *)view damping:(CGFloat)damping;

/**
 *  Disable view draggable.
 */
- (void)removeDraggable;

/**
 *  If you call make draggable method in the initialize method such as `-initWithFrame:`,
 *  `-viewDidLoad`, the view may not be layout correctly at that time. So you should
 *  update snap point in `-layoutSubviews` or `-viewDidLayoutSubviews`.
 *
 *  By the way, you can call make draggable method in `-layoutSubviews` or
 *  `-viewDidLayoutSubviews` directly instead of update snap point.
 */
- (void)updateSnapPoint;

@end
