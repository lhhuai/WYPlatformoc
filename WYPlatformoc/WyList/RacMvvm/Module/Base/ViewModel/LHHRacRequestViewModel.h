//
//  LHHRacRequestViewModel.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacBaseViewModel.h"
#import <AFNetworking/AFNetworking.h>

// 继承自LHHRacBaseViewModel
// 需要网络请求的VM继承该类
// 该类有一个公共属性sessionManager，一个该属性的懒加载方法和一个dealloc中取消网络请求的方法
@interface LHHRacRequestViewModel : LHHRacBaseViewModel

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end
