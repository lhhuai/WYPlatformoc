//
//  LHHCommonColors.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/3.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HEXACOLOR(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


// 主题模块背景
#define COLOR_MAIN_BG                               WYRGB(239, 239, 244)

// 深灰色灰       #646464
#define COLOR_HALF_GRAY               [UIColor wy_colorFromHex:0x646464]

// 中灰色       #969696
#define COLOR_LIGHT_GRAY              [UIColor wy_colorFromHex:0x969696]

// 模块分割线：轻素的浅灰色用作搭配及展示型文字的颜色  #dcdcdc
#define COLOR_SEPARATOR_LINE          [UIColor wy_colorFromHex:0xdcdcdc]

// app背景色：素灰色的背景，有效降低屏幕色彩适配风险     #f0f0f0
#define COLOR_GRAY_BACKGROUND         [UIColor wy_colorFromHex:0xf0f0f0]