//
//  WYCombinationEnd.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "WYCombinationEnd.h"

@implementation WYCombinationEnd

+ (instancetype)end {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self class] new];
    });
    
    return instance;
}

@end
