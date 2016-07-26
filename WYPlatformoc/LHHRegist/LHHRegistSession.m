//
//  LHHRegistSession.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/25.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRegistSession.h"
#import "LHHUserManager.h"

@implementation LHHRegistSession

- (void)registWithUser:(LHHUser *)user completeBlock:(void(^)())complete exceptionBlock:(void(^)())exception {
    LHHUserManager *userManager = [[LHHUserManager alloc] init];
    BOOL flag = [userManager insertUser:user];
    if (flag) {
        complete();
    } else {
        exception();
    }
}

@end
