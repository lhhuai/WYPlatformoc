//
//  LHHRacArticleViewModel.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacBaseViewModel.h"
#import "LHHRacArticleModel.h"
#import "LHHRacSQLInterface.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

// vc的vm
// 因为需要进行数据缓存，所以遵循SQLInterface
// 因为需要进行网络请求，所以继承自RequestViewModel

@interface LHHRacArticleViewModel : LHHRacBaseViewModel <LHHRacSQLInterface>

@property (nonatomic, strong) RACSignal *requestSignal; // 网络请求信号量
@property (nonatomic, assign) NSInteger currentPage;    // 当前页码
@property (nonatomic, strong) NSArray *dataSource;      // tableView的数据源

@end
