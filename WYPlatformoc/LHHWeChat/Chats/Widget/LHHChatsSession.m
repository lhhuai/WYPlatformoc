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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *chatsData = @[@{kChatsType:@"Person", kChatsName:@"WY"},
                               @{kChatsType:@"Person", kChatsName:@"LY"},
                               @{kChatsType:@"Person", kChatsName:@"LM"},
                               @{kChatsType:@"Person", kChatsName:@"JD"},
                               @{kChatsType:@"Person", kChatsName:@"ZD"}];
        if (complete) {
            complete(chatsData);
        }
    });
}

- (void)getAirlinesWithCondition:(NSString *)condition pager:(LHHPager *)pager completeBlock:(void(^)(NSArray *airlines))complete exceptionBlock:(void(^)())exception {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"airlineData" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *airlines = dict[@"airlines"];
        
        NSArray *result = [airlines subarrayWithRange:NSMakeRange((pager.pageNo - 1)*pager.pageSize, pager.pageSize)];
        
        if (complete) {
            complete(result);
        }
    });
}
                  
@end
