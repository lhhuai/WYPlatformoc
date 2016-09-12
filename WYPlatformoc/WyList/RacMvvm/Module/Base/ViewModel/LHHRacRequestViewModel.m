//
//  LHHRacRequestViewModel.m
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacRequestViewModel.h"

@implementation LHHRacRequestViewModel

// Lazy Load
- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
    }
    return _sessionManager;
}

// 在对象销毁时，别忘了取消已经在队列中的请求
- (void)dealloc {
    [self.sessionManager invalidateSessionCancelingTasks:YES];
}

@end
