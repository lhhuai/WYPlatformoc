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

// 主题模块背景  #ffffff
#define COLOR_WHITE                   [UIColor wy_colorFromHex:0xffffff]

// 主色调      #69af00
#define COLOR_WY_GREEN                [UIColor wy_colorFromHex:0x69AF00]
// 辅色
// 价格数字及可点击按钮（付款）.橙色给人安全感     #fa6400
#define COLOR_IMPORTMENT_INFO         [UIColor wy_colorFromHex:0xfa6400]

// 消息及重要提醒：红色给人警示的感觉 #fa3b00
#define COLOR_WARNING_RED             [UIColor wy_colorFromHex:0xfa3b00]

// 导航 标题文字：稳重的黑色，可用作导航标题文字
#define COLOR_TITLE                   [UIColor wy_colorFromHex:0x000000]

// 模块标题文字：渐沉岩黑色，可用作模块标题文字     #323232
#define COLOR_SECOND_TITLE            [UIColor wy_colorFromHex:0x323232]

// 深灰色灰       #646464
#define COLOR_HALF_GRAY               [UIColor wy_colorFromHex:0x646464]

// 深灰色灰       #646464
#define COLOR_HALF_GRAY               [UIColor wy_colorFromHex:0x646464]

// 中灰色       #969696
#define COLOR_LIGHT_GRAY              [UIColor wy_colorFromHex:0x969696]

// 模块分割线：轻素的浅灰色用作搭配及展示型文字的颜色  #dcdcdc
#define COLOR_SEPARATOR_LINE          [UIColor wy_colorFromHex:0xdcdcdc]

// app背景色：素灰色的背景，有效降低屏幕色彩适配风险     #f0f0f0
#define COLOR_GRAY_BACKGROUND         [UIColor wy_colorFromHex:0xf0f0f0]


