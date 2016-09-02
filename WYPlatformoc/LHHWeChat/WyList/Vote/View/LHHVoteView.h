//
//  LHHVoteView.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHVoteModel.h"

@interface LHHVoteView : UIView

@property (nonatomic, strong) LHHVoteModel *voteModel;

- (id)initWithFrame:(CGRect)frame voteMedel:(LHHVoteModel *)voteMedel;
- (void)thumbUpStartAnimation;

@end
