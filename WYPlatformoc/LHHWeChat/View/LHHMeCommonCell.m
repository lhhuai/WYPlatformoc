//
//  LHHMeCommonCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeCommonCell.h"
#import "UIView+WYLayout.h"

#define marginLeft             WY_SIZE(10)
#define marginRight            WY_SIZE(10)

@interface LHHMeCommonCell()

@property (nonatomic, strong) UIImageView *mcTitleLeftIV;
@property (nonatomic, strong) UILabel *mcTitleLbl;
@property (nonatomic, strong) UIImageView *mcTitleRightIV;

@end

@implementation LHHMeCommonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.backgroundColor = [UIColor whiteColor];
    CGFloat cellHeight = WY_SIZE(30);
    
    self.mcTitleLeftIV = [[UIImageView alloc] initWithFrame:CGRectMake(marginLeft, (cellHeight - WY_IMAGE_SIZE(18)) * .5, WY_IMAGE_SIZE(18), WY_IMAGE_SIZE(18))];
    self.mcTitleLeftIV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.mcTitleLeftIV];
    
    self.mcTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.mcTitleLeftIV.right + marginLeft, 0, WY_SIZE(200), cellHeight)];
    self.mcTitleLbl.backgroundColor = [UIColor clearColor];
    self.mcTitleLbl.textColor = [UIColor wy_colorFromHex:0x000000];
    self.mcTitleLbl.font = WY_FONT(12);
    [self.contentView addSubview:self.mcTitleLbl];
    
    self.mcTitleRightIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wechat_arrow_left"]];
    self.mcTitleRightIV.width = WY_IMAGE_SIZE(12);
    self.mcTitleRightIV.height = WY_IMAGE_SIZE(12);
    self.mcTitleRightIV.x = SCREEN_WIDTH - marginRight - self.mcTitleRightIV.width;
    self.mcTitleRightIV.y = (cellHeight - self.mcTitleRightIV.height) * .5;
    [self.contentView addSubview:self.mcTitleRightIV];
}

- (void)updateCellWithImageName:(NSString *)imageName titleName:(NSString *)titleName {
    self.mcTitleLeftIV.image = [UIImage imageNamed:imageName];
    
    self.mcTitleLbl.text = titleName;
}

@end
