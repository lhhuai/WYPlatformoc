//
//  LHHAdaptiveManager.h
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHHAdaptiveManager : NSObject

// 字体的缩放因子
+(CGFloat)fontScale;

// 列表图片缩放因子
+(CGFloat)imageScale;

/// 间距的缩放因子
+ (CGFloat)marginScale;

@end
