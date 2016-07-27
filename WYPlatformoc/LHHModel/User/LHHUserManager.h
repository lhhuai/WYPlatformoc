//
//  LHHUserManager.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/8.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHHUser.h"

@interface LHHUserManager : NSObject

+ (instancetype)shareInstance;

- (BOOL)insertUser:(LHHUser *)user;
- (LHHUser *)userWithAccount:(NSString *)account;

@end
