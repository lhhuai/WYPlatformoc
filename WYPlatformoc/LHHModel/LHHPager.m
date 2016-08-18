//
//  LHHPager.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHPager.h"

@implementation LHHPager

- (id)init {
    if (self = [super init]) {
        self.pageNo = 1;
        self.pageSize = 10;
        self.isEnd = NO;
    }
    return self;
}

@end
