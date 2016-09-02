//
//  LHHVoteView.m
//  WYPlatformoc
//
//  Created by seaphy on 16/9/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHVoteView.h"
#import "UILabel+LHHAddition.h"
#import "UIView+WYLayout.h"
#import "LHHPercentBar.h"

@interface LHHVoteView()

@property (nonatomic, strong) UILabel *voteLabel;
@property (nonatomic, strong) UILabel *percentLabel;
@property (nonatomic, strong) UIImageView *thumbUpIV;
@property (nonatomic, strong) LHHPercentBar *percentBar;

@end

@implementation LHHVoteView

- (id)initWithFrame:(CGRect)frame voteMedel:(LHHVoteModel *)voteMedel {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = WY_SIZE(3);
        self.layer.shadowOffset = CGSizeMake(WY_SIZE(-2.0), 0.0);
        self.layer.shadowRadius = WY_SIZE(3);
        self.layer.shadowOpacity = .4;
        
        [self setupView];
        
        self.voteModel = voteMedel;
    }
    return self;
}

- (void)setupView {
    self.percentBar = [[LHHPercentBar alloc] initWithFrame:self.bounds];
    [self addSubview:self.percentBar];
    
    self.voteLabel = [UILabel labelWithFont:WY_FONT_SECOND_TITLE textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft numberOfLines:0];
    [self addSubview:self.voteLabel];
    
    self.percentLabel = [UILabel labelWithFont:WY_FONT_MIDDLE textColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentRight numberOfLines:1];
    [self addSubview:self.percentLabel];
    
    self.thumbUpIV = [[UIImageView alloc] init];
    [self addSubview:self.thumbUpIV];
}

- (void)setVoteModel:(LHHVoteModel *)voteModel {
    _voteModel = voteModel;
    
    self.voteLabel.text = self.voteModel.title;
    self.percentLabel.text = [NSString stringWithFormat:@"%.f%%", ([self.voteModel.votes floatValue]/[self.voteModel.totalVotes floatValue] * 100)];
    self.percentLabel.textColor = self.voteModel.isselected ? WYRGB(31, 149, 255) : [UIColor lightGrayColor];
    
    self.thumbUpIV.image = self.voteModel.isselected ? [UIImage imageNamed:@"vote_like_blue"] : [UIImage imageNamed:@"vote_like_placehold"];
    
    if (_voteModel.isvote) {
        self.percentBar.foregroundColor = _voteModel.isselected ? WYRGB(31, 149, 255) : WYRGBA(31, 149, 255, 50);
        self.percentBar.percentage = [_voteModel.votes floatValue] / [_voteModel.totalVotes floatValue] * 100;
    } else {
        [self.percentBar reset];
    }
}

- (void)thumbUpStartAnimation {
    self.thumbUpIV.transform = CGAffineTransformIdentity;
    
    [UIView animateKeyframesWithDuration:.5 delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3.0 animations:^{
            self.thumbUpIV.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:1/3.0 animations:^{
            self.thumbUpIV.transform = CGAffineTransformMakeScale(.8, .8);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations:^{
            self.thumbUpIV.transform = CGAffineTransformMakeScale(1, 1);
        }];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.percentBar.frame = self.bounds;
    
    self.thumbUpIV.x = SCREEN_WIDTH - WY_SIZE(15 + 15 + 25 + 10);
    self.thumbUpIV.width = WY_SIZE(25);
    self.thumbUpIV.height = WY_SIZE(25);
    self.thumbUpIV.centerY = self.height * .5;
    
    self.percentLabel.x = self.thumbUpIV.x - WY_SIZE(35 + 10);
    self.percentLabel.y = 0;
    self.percentLabel.width = WY_SIZE(35);
    self.percentLabel.height = self.height;
    
    self.voteLabel.x = WY_SIZE(5);
    self.voteLabel.y = 0;
    self.voteLabel.width = self.percentLabel.x - WY_SIZE(10 + 5);
    self.voteLabel.height = self.height;
}

@end
