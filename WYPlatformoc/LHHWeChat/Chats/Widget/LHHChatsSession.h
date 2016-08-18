//
//  LHHChatsSession.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseServiceSession.h"
#import "LHHPager.h"

#define kChatsType                       @"ChatsType"
#define kChatsName                       @"ChatsName"
#define kChatsMessage                    @"ChatsMessage"
#define kChatsLastTime                   @"ChatsLastTime"

@interface LHHChatsSession : LHHBaseServiceSession

- (void)getChatsWithCondition:(NSString *)condition completeBlock:(void(^)(NSArray *chatsData))complete exceptionBlock:(void(^)())exception;
- (void)getAirlinesWithCondition:(NSString *)condition pager:(LHHPager *)pager completeBlock:(void(^)(NSArray *airlines))complete exceptionBlock:(void(^)())exception;

@end
