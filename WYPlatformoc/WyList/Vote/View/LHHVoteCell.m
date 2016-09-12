//
//  LHHVoteCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/31.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHVoteCell.h"
#import "LHHVoteView.h"

@interface LHHVoteCell()

@property (nonatomic, strong) LHHVoteView *voteView;

@end

@implementation LHHVoteCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = WY_SIZE(.5);
        self.layer.cornerRadius = WY_SIZE(3);
        self.layer.masksToBounds = YES;
        
        [self setupVoteView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.voteView.frame = self.bounds;
}

- (void)setupVoteView {
    self.voteView = [[LHHVoteView alloc] initWithFrame:self.frame voteMedel:nil];
    [self.contentView addSubview:self.voteView];
}

- (void)setVoteModel:(LHHVoteModel *)voteModel {
    _voteModel = voteModel;
    self.voteView.voteModel = voteModel;
}

- (void)thumpUpStartAnimation {
    [self.voteView thumbUpStartAnimation];
}

- (void)setFrame:(CGRect)frame {
    if (frame.size.width == SCREEN_WIDTH) {
        frame = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(WY_SIZE(5), WY_SIZE(15), WY_SIZE(5), WY_SIZE(15)));
    } else {
        frame.origin.x += WY_SIZE(15);
    }
    
    [super setFrame:frame];
}

@end
