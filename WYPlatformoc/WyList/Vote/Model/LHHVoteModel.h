//
//  LHHVoteModel.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/30.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHHVoteModel : NSObject

/**投票数量*/
@property (nonatomic, strong) NSNumber *votes;

/**总投票数量*/
@property (nonatomic, strong) NSNumber *totalVotes;

/**投票标题*/
@property (nonatomic, copy) NSString *title;

/**是否自己已经投票*/
@property (nonatomic, assign) BOOL isvote;

/**是否自己已经选择*/
@property (nonatomic, assign) BOOL isselected;

/**投票cell的高度*/
@property (nonatomic, assign) CGFloat voteCell_H;

@end
