//
//  LHHLoginSession.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/26.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHLoginSession.h"

@implementation LHHLoginSession

- (void)loginWithUser:(LHHUser *)user completeBlock:(void(^)())complete exceptionBlock:(void(^)())exception {
    LHHUserManager *userManager = [[LHHUserManager alloc] init];
    LHHUser *existUser = [userManager userWithAccount:user.account];
    if (existUser && [existUser.password isEqualToString:user.password]) {
        complete();
    } else {
        exception();
    }
}

@end
