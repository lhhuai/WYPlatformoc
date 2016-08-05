//
//  LHHMeCommonCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeCommonCell.h"

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
    self.mcTitleLeftIV = [UIImageView alloc] initWithFrame:CGRectMake(WY_SIZE(21), <#CGFloat y#>, WY_IMAGE_SIZE(32), WY_IMAGE_SIZE(32))
}

@end
