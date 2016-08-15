//
//  LHHChatsSession.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHChatsSession.h"

@implementation LHHChatsSession

- (void)getChatsWithCondition:(NSString *)condition completeBlock:(void(^)(NSArray *chatsData))complete exceptionBlock:(void(^)())exception {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *chatsData = @[@{kChatsType:@"Search", kChatsName:@"Search"},
                               @{kChatsType:@"Person", kChatsName:@"WY"},
                               @{kChatsType:@"Person", kChatsName:@"LY"},
                               @{kChatsType:@"Person", kChatsName:@"LM"},
                               @{kChatsType:@"Person", kChatsName:@"JD"},
                               @{kChatsType:@"Person", kChatsName:@"ZD"}];
        if (complete) {
            complete(chatsData);
        }
    });
}
                  
@end
