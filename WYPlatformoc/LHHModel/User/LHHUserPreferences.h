//
//  LHHUserPreferences.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/3.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHHUser.h"

@interface LHHUserPreferences : NSObject

@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, strong) LHHUser *user;

+ (LHHUserPreferences *)sharedInstance;
- (void)archiveUser:(LHHUser *)user;
- (BOOL)checkAccount:(NSString *)account password:(NSString *)password;
- (void)saveIsLogin:(BOOL)isLogin;

@end
