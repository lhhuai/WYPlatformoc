//
//  LHHLoginViewController.h
//  LHHOCStudy
//
//  Created by seaphy on 16/3/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHBaseViewController.h"

#define kLHHLoginViewController                          @"LHHLoginViewController"
#define kLHHGotoWechatViewController                     @"LHHGotoWechatViewController"

typedef void (^LHHLoginCallBackBlock)();

typedef NS_ENUM(NSInteger, LHHGotoLoginType) {
    LHHGotoLoginTypeWeChat,
    LHHGotoLoginTypeOther
};

@interface LHHLoginViewController : LHHBaseViewController

@property (nonatomic, copy) LHHLoginCallBackBlock completeBlock;
@property (nonatomic, assign) LHHGotoLoginType gotoLoginType;

@end
