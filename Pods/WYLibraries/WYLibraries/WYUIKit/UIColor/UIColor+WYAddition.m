//
//  UIColor+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/11.
//  Copyright © 2016年 seaphyliu. All rights reserved.
//

#import "UIColor+WYAddition.h"

@implementation UIColor (WYAddition)

+ (UIColor *)wy_colorFromHex:(NSInteger)hex {
    return [self wy_colorFromHex:hex alpha:1.0f];
}

+ (UIColor *)wy_colorFromHex:(NSInteger)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0xFF00) >> 8))/255.0
                            blue:((float)(hex & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)wy_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [self wy_colorWithRed:red green:green blue:blue alpha:100];
}

+ (UIColor *)wy_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha {
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha / 100.0f];
}

@end
