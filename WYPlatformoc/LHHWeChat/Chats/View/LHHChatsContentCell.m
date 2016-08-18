//
//  LHHChatsContentCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHChatsContentCell.h"
#import "UIView+WYLayout.h"

@interface LHHChatsContentCell()

@property (nonatomic, strong) UILabel *chatsNameLbl;
@property (nonatomic, strong) UILabel *lineBottomLbl;

@end

@implementation LHHChatsContentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.chatsNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(WY_SIZE(12), 0, SCREEN_WIDTH - 2*WY_SIZE(12), HeightForChatsContentCell)];
    self.chatsNameLbl.textColor = COLOR_TITLE;
    self.chatsNameLbl.font = WY_FONT_TITLE;
    self.chatsNameLbl.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.chatsNameLbl];
    
    self.lineBottomLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, HeightForChatsContentCell - WY_SIZE(.5), SCREEN_WIDTH, WY_SIZE(.5))];
    self.lineBottomLbl.backgroundColor = COLOR_SEPARATOR_LINE;
    [self.contentView addSubview:self.lineBottomLbl];
}

- (void)updateCell:(LHHChats *)chats isLast:(BOOL)isLast {
    self.chatsNameLbl.text = chats.chatsName;
    
    if (isLast) {
        self.lineBottomLbl.x = 0;
        self.lineBottomLbl.width = SCREEN_WIDTH;
    } else {
        self.lineBottomLbl.x = WY_SIZE(10);
        self.lineBottomLbl.width = SCREEN_WIDTH - WY_SIZE(10);
    }
}

@end
