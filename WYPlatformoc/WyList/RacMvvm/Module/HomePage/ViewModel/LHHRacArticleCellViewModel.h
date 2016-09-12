//
//  LHHRacArticleCellViewModel.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacBaseViewModel.h"
#import "LHHRacArticleModel.h"

// cell的vm
// 无需网络请求，所以继承BaseViewModel即可
@interface LHHRacArticleCellViewModel : LHHRacBaseViewModel

@property (nonatomic, strong) LHHRacArticleModel *articleModel;
@property (nonatomic, copy, readonly) NSString *titleText;
@property (nonatomic, copy, readonly) NSString *authorText;
@property (nonatomic, copy, readonly) NSString *categoryText;

- (id)initWithArticleModel:(LHHRacArticleModel *)articleModel;

@end
