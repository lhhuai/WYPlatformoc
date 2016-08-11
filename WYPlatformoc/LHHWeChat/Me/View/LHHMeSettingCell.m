//
//  LHHMeSettingCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/10.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeSettingCell.h"
#import "UIView+WYLayout.h"

@interface LHHMeSettingCell()

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIImageView *rightArrowIV;

@property (nonatomic, strong) UIView *accountProtectionView;

@end

@implementation LHHMeSettingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(MarginLeftForMeSettingCell, 0, WY_SIZE(200), HeightForMeSettingCell)];
    self.titleLbl.backgroundColor = [UIColor clearColor];
    self.titleLbl.textColor = [UIColor wy_colorFromHex:0x000000];
    self.titleLbl.font = WY_FONT_CONTENT;
    [self.contentView addSubview:self.titleLbl];
    
    self.rightArrowIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wechat_arrow_left"]];
    self.rightArrowIV.width = WY_IMAGE_SIZE(14);
    self.rightArrowIV.height = WY_IMAGE_SIZE(14);
    self.rightArrowIV.x = SCREEN_WIDTH - WeChat_Me_MarginRight - self.rightArrowIV.width;
    self.rightArrowIV.y = (HeightForMeSettingCell - self.rightArrowIV.height) * .5;
    [self.contentView addSubview:self.rightArrowIV];
    
}

- (void)updateCell:(LHHMeSettingCellModel *)settingCellModel {
    self.titleLbl.text = settingCellModel.title;
}

@end
