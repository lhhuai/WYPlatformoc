//
//  LHHDefines.h
//  LHHOCStudy
//
//  Created by seaphy on 16/2/25.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])

// iPhone 屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)

// iPhone 屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

// iPhone 屏幕尺寸
#define PHONE_SCREEN_SIZE (CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - PHONE_STATUSBAR_HEIGHT))

// iPhone statusbar 高度
#define PHONE_STATUSBAR_HEIGHT      20

// iPhone 默认导航条高度
#define PHONE_NAVIGATIONBAR_HEIGHT  44

// iPhone 默认TabBar高度
#define PHONE_TABBAR_HEIGHT        49

// 此项目中普通UIViewController的view的高度
#define VIEW_HEIGHT     (SCREEN_HEIGHT - PHONE_NAVIGATIONBAR_HEIGHT - PHONE_STATUSBAR_HEIGHT - PHONE_TABBAR_HEIGHT)

// 此项目中隐藏tabbar后UIViewController的view的高度
#define VIEW_HIDETABBAR_HEIGHT     (SCREEN_HEIGHT - PHONE_NAVIGATIONBAR_HEIGHT - PHONE_STATUSBAR_HEIGHT)


#define kLHHGotoLoginViewController                      @"LHHGotoLoginViewController"
#define kLHHGotoWechatViewController                     @"LHHGotoWechatViewController"

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define WY_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero
#else
#define WY_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero

#endif



#define WY_DOCUMENT_DIRECTORY    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#define WY_APP_NAME              ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define WY_APP_VERSION           ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define WY_APP_BUILD             ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])




