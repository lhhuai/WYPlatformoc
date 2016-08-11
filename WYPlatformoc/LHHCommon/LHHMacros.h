//
//  LHHMacros.h
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#ifndef LHHMacros_h
#define LHHMacros_h

#define PHONE5_WIDTH                320.0
#define PHONE5_HEIGHT               568.0
#define PHONE6_WIDTH                375.0
#define PHONE6P_WIDTH               414.0

// 6p字体的缩放因子
#define FONT_PHONE6P_SCALE           (PHONE6P_WIDTH / PHONE6_WIDTH)
#define FONT_PHONE6_SCALE            1

// 6p列表图片的缩放因子
#define IMAGE_PHONE6P_SCALE          (PHONE6P_WIDTH / PHONE6_WIDTH)
#define IMAGE_PHONE6_SCALE           1

// 6p间距的缩放因子
#define MARGIN_PHONE6P_SCALE         (PHONE6P_WIDTH / PHONE6_WIDTH)
#define MARGIN_PHONE6_SCALE          1


#define WY_SIZE(size)                (size * [LHHAdaptiveManager marginScale])
#define WY_IMAGE_SIZE(size)          (size * [LHHAdaptiveManager imageScale])
#define WY_FONT(fontSize)            ([UIFont     systemFontOfSize:fontSize * [LHHAdaptiveManager fontScale]])
#define WY_BOLD_FONT(fontSize)       ([UIFont boldSystemFontOfSize:fontSize * [LHHAdaptiveManager fontScale]])

#define WY_FONT_CONTENT              WY_FONT(17)

#endif /* LHHMacros_h */
