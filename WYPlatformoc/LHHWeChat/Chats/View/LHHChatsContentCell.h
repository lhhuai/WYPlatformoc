//
//  LHHChatsContentCell.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHChats.h"

#define HeightForChatsContentCell                WY_SIZE(68)

@interface LHHChatsContentCell : UITableViewCell

- (void)updateCell:(LHHChats *)chats isLast:(BOOL)isLast;

@end
