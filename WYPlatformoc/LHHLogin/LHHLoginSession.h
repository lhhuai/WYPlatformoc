//
//  LHHLoginSession.h
//  WYPlatformoc
//
//  Created by seaphy on 16/7/26.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseServiceSession.h"
#import "LHHUserManager.h"

@interface LHHLoginSession : LHHBaseServiceSession

- (void)loginWithUser:(LHHUser *)user completeBlock:(void(^)())complete exceptionBlock:(void(^)())exception;

@end
