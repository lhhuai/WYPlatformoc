//
//  LHHRacArticleCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacArticleCell.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation LHHRacArticleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
    }
    return self;
}

// 设置信号量，当cell的vm被重新赋值时，更新cell显示的数据
- (void)setupCell {
    // __weak typeof(self) weakSelf = self;
    @weakify(self);
    [RACObserve(self, viewModel) subscribeNext:^(LHHRacArticleCellViewModel *viewModel) {
        // 使用strong修饰self，防止在self在使用中被释放
        @strongify(self);
        
        // vm已经将要显示的文本处理好了，在cell中直接赋值就行
        self.textLabel.text = viewModel.titleText;
        self.detailTextLabel.text = viewModel.authorText;
    }];
}

@end
