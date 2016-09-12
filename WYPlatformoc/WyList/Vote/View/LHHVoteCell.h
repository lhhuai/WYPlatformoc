//
//  LHHVoteCell.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/31.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHVoteModel.h"

#define kLHHVoteCellIdentifier                       @"LHHVoteCellIdentifier"

@interface LHHVoteCell : UITableViewCell

@property (nonatomic, strong) LHHVoteModel *voteModel;
@property (nonatomic, assign) NSInteger row;

- (void)thumpUpStartAnimation;

@end
