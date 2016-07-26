//
//  WYLineView.h
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WYLineViewAlignment) {
    WYLineViewAlignmentTop = 0,
    WYLineViewAlignmentCenter = 1,
    WYLineViewAlignmentBottom = 2
};

@interface WYLineView : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) BOOL vertical;
@property (nonatomic, assign) BOOL normalBorder;
@property (nonatomic, assign) WYLineViewAlignment alignment;

@end
