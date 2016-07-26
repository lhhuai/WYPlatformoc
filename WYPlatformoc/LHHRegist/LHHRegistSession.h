//
//  LHHRegistSession.h
//  WYPlatformoc
//
//  Created by seaphy on 16/7/25.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseServiceSession.h"

@class LHHUser;

@interface LHHRegistSession : LHHBaseServiceSession

- (void)registWithUser:(LHHUser *)user completeBlock:(void(^)())complete exceptionBlock:(void(^)())exception;

@end
