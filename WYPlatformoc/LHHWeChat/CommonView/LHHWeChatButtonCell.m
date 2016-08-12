//
//  LHHWeChatButtonCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/10.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHWeChatButtonCell.h"

@interface LHHWeChatButtonCell()

@property (nonatomic, strong) UILabel *titleLbl;

@end

@implementation LHHWeChatButtonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HeightForWeChatButtonCell)];
    self.titleLbl.backgroundColor = [UIColor clearColor];
    self.titleLbl.textColor = [UIColor wy_colorFromHex:0x000000];
    self.titleLbl.font = WY_FONT_TITLE;
    self.titleLbl.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLbl];
}

- (void)updateCell:(NSString *)title {
    self.titleLbl.text = title;
}

@end
