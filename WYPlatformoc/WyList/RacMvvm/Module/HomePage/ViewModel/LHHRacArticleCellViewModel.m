//
//  LHHRacArticleCellViewModel.m
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacArticleCellViewModel.h"

@interface LHHRacArticleCellViewModel()

@end

@implementation LHHRacArticleCellViewModel

- (id)initWithArticleModel:(LHHRacArticleModel *)articleModel {
    if (self = [super init]) {
        self.articleModel = articleModel;
        [self setupData];
    }
    return self;
}

// 处理Model中的数据
- (void)setupData {
    _titleText = self.articleModel.title;
    _authorText = self.articleModel.authorName;
    if (self.articleModel.categoryName == nil) {
        self.articleModel.categoryName = @"";
    }
    _categoryText = [@"分类:" stringByAppendingString:self.articleModel.categoryName];
}

@end
