//
//  LHHMeHeaderCell.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHWeChatUser.h"

#define HeightForMeHeaderCell               WY_SIZE(88)

@interface LHHMeHeaderCell : UITableViewCell

- (void)updateCell:(LHHWeChatUser *)user;

@end
