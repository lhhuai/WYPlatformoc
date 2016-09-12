//
//  LHHVoteModel.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/30.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHVoteModel.h"

@implementation LHHVoteModel

-(void)setTitle:(NSString *)title{//根据数据算出每行cell的实际高度
    
    _title = title;
    
    CGFloat title_H = [title boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - WY_SIZE(15+15+10+25+10+35+10+5), WY_SIZE(100))
                                          options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:WY_FONT_SECOND_TITLE}
                                          context:nil].size.height;
    
    self.voteCell_H = title_H + WY_SIZE(30);
}

@end
