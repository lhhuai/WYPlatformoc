//
//  LHHAdaptiveManager.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHAdaptiveManager.h"

@implementation LHHAdaptiveManager

// 字体的缩放因子
+(CGFloat)fontScale {
    if ([UIDevice isPhone6p]) {
        return FONT_PHONE6P_SCALE;
    }
    else {
        return FONT_PHONE6_SCALE;
    }
}

// 列表图片缩放因子
+(CGFloat)imageScale {
    if ([UIDevice isPhone6p]) {
        return IMAGE_PHONE6P_SCALE;
    }
    else {
        return IMAGE_PHONE6_SCALE;
    }
}

/// 间距的缩放因子
+ (CGFloat)marginScale {
    if ([UIDevice isPhone6p]) {
        return MARGIN_PHONE6P_SCALE;
    }else {
        return MARGIN_PHONE6_SCALE;
    }
}

@end
