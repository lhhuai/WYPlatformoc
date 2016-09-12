//
//  LHHRacArticleCell.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHRacArticleCellViewModel.h"

#define HeightForRacArticleCell             WY_SIZE(44)

@interface LHHRacArticleCell : UITableViewCell

@property (nonatomic, strong) LHHRacArticleCellViewModel *viewModel;

@end
