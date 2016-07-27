//
//  UIDevice+UIDeviceExt.h
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (UIDeviceExt)

/*
 use
 ipad is 3 and iphone is 2
 */
+ (NSString *)deviceCode;
// 获取设备型号，如："iPhone4,1"
+ (NSString*) deviceModel;

// 获取设备名称，如：iPhone5, iPhone5S
+ (NSString*) deviceName;

+ (NSString*) deviceNameWithDeviceModel:(BOOL)shouldIncludeDeviceModel;

// 获取设备UDID，使用了OpenUDID
+ (NSString*) UDID;
+ (NSString *)UDID16;
// 获取本地IP
+ (NSArray *)localIPAddresses;

+ (BOOL)isRetina4inch;

+ (BOOL)isPhone5;

+ (BOOL)isPhone6;

+ (BOOL)isPhone6p;

@end
