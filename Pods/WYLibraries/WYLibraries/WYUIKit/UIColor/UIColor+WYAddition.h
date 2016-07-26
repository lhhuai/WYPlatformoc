//
//  UIColor+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/11.
//  Copyright © 2016年 seaphyliu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WYRGB(RED, GREEN, BLUE)             [UIColor wy_colorWithRed:RED green:GREEN blue:BLUE]
#define WYRGBA(RED, GREEN, BLUE, ALPHA)     [UIColor wy_colorWithRed:RED green:GREEN blue:BLUE alpha:ALPHA]
#define WYRGBFromHex(HEX)                   [UIColor wy_colorFromHex:HEX]

@interface UIColor (WYAddition)

+ (UIColor *)wy_colorFromHex:(NSInteger)hex;
+ (UIColor *)wy_colorFromHex:(NSInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)wy_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;

/**
 red:0-255
 green:0-255
 blue:0-255
 alpha:0-100
 */
+ (UIColor *)wy_colorWithRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha;

@end
