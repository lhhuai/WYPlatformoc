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

// 9号字体
#define WY_FONT_MOST_SMALL_TITLE                    WY_FONT(9)
// 10号字体
#define WY_FONT_SMALL_TITLE                         WY_FONT(10)
// 11号字体
#define WY_FONT_SEVERAL                             WY_FONT(11)
// 12号字体
#define WY_FONT_CONTENT                             WY_FONT(12)
// 13号字体
#define WY_FONT_MIDDLE                              WY_FONT(13)
// 14号字体
#define WY_FONT_MORE                                WY_FONT(14)
// 15号字体
#define WY_FONT_SECOND_TITLE                        WY_FONT(15)
// 16号字体
#define WY_FONT_16                                  WY_FONT(16)
// 18号字体
#define WY_FONT_TITLE                               WY_FONT(18)
// 20号字体
#define WY_FONT_SIZE_LARGE                          WY_FONT(20)

#endif /* LHHMacros_h */
