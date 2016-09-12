//
//  LHHRacArticleModel.m
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacArticleModel.h"
#import <MJExtension/MJExtension.h>

@implementation LHHRacArticleModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"articleId" : @"id"};
}

@end
