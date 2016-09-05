//
//  LHHMeHeaderCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeHeaderCell.h"
#import "UIView+WYLayout.h"
#import "UIView+LHHDraggable.h"

@interface LHHMeHeaderCell()

@property (nonatomic, strong) UIImageView *profilePhotoIV;
@property (nonatomic, strong) UILabel *nameLbl;
@property (nonatomic, strong) UILabel *weChatIDLbl;
@property (nonatomic, strong) UIImageView *myQRCodeIV;
@property (nonatomic, strong) UIImageView *rightArrowIV;

@end

@implementation LHHMeHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.backgroundColor = COLOR_WHITE;
    
    UILabel *topLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WY_SIZE(.5))];
    topLine.backgroundColor = COLOR_SEPARATOR_LINE;
    [self.contentView addSubview:topLine];
    
    self.profilePhotoIV = [[UIImageView alloc] initWithFrame:CGRectMake(WeChat_Me_MarginLeft, (HeightForMeHeaderCell - WY_IMAGE_SIZE(60)) * .5, WY_IMAGE_SIZE(60), WY_IMAGE_SIZE(60))];
    self.profilePhotoIV.userInteractionEnabled = YES;
    [self.contentView addSubview:self.profilePhotoIV];
    [self.profilePhotoIV makeDraggable];
    
    self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.profilePhotoIV.right + WY_SIZE(10), HeightForMeHeaderCell*.5 - WY_SIZE(24), WY_SIZE(150), WY_SIZE(24))];
    self.nameLbl.backgroundColor = [UIColor clearColor];
    self.nameLbl.textColor = COLOR_TITLE;
    self.nameLbl.font = WY_FONT_SECOND_TITLE;
    [self.contentView addSubview:self.nameLbl];
    
    self.weChatIDLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.profilePhotoIV.right + WY_SIZE(10), HeightForMeHeaderCell*.5, WY_SIZE(150), WY_SIZE(24))];
    self.weChatIDLbl.backgroundColor = [UIColor clearColor];
    self.weChatIDLbl.textColor = COLOR_TITLE;
    self.weChatIDLbl.font = WY_FONT_MORE;
    [self.contentView addSubview:self.weChatIDLbl];
    
    self.myQRCodeIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wechat_me_qrcode"]];
    self.myQRCodeIV.width = WY_IMAGE_SIZE(14);
    self.myQRCodeIV.height = WY_IMAGE_SIZE(14);
    self.myQRCodeIV.x = SCREEN_WIDTH - WY_IMAGE_SIZE(14 + 14) - WeChat_Me_MarginRight - WY_SIZE(4);
    self.myQRCodeIV.y = (HeightForMeHeaderCell - self.myQRCodeIV.height) * .5;
    self.myQRCodeIV.alpha = .5;
    [self.contentView addSubview:self.myQRCodeIV];
    
    self.rightArrowIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wechat_arrow_left"]];
    self.rightArrowIV.width = WY_IMAGE_SIZE(14);
    self.rightArrowIV.height = WY_IMAGE_SIZE(14);
    self.rightArrowIV.x = SCREEN_WIDTH - WeChat_Me_MarginRight - self.rightArrowIV.width;
    self.rightArrowIV.y = (HeightForMeHeaderCell - self.rightArrowIV.height) * .5;
    [self.contentView addSubview:self.rightArrowIV];
    
    UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, HeightForMeHeaderCell - WY_SIZE(.5), SCREEN_WIDTH, WY_SIZE(.5))];
    bottomLine.backgroundColor = COLOR_SEPARATOR_LINE;
    [self.contentView addSubview:bottomLine];
}

- (void)updateCell:(LHHWeChatUser *)user {
    self.profilePhotoIV.image = [UIImage imageNamed:user.profilePhoto];
    
    self.nameLbl.text = user.name;
    
    self.weChatIDLbl.text = [NSString stringWithFormat:@"WeChat ID: %@", user.weChatID];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.profilePhotoIV updateSnapPoint];
}

@end
