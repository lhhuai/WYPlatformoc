//
//  LHHRegistTableViewCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/7.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRegistTableViewCell.h"
#import "LHHCommonDefines.h"
#import "LHHCommonColors.h"
#import "UIView+WYLayout.h"

@interface LHHRegistTableViewCell()

@property (nonatomic, strong) UILabel *separatorLine;

@end

@implementation LHHRegistTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(WY_SIZE(21), 0, WY_SIZE(90), HeightForRegistTableViewCell)];
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.font = WY_FONT_16;
    [self addSubview:self.label];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(self.label.right + WY_SIZE(5), 0, SCREEN_WIDTH - self.label.right - WY_SIZE(21), HeightForRegistTableViewCell)];
    self.textField.font = WY_FONT_16;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:self.textField];
    
    self.separatorLine = [[UILabel alloc]initWithFrame:CGRectMake(WY_SIZE(21), HeightForRegistTableViewCell - WY_SIZE(.5), SCREEN_WIDTH - WY_SIZE(21), WY_SIZE(.5))];
    self.separatorLine.backgroundColor = COLOR_SEPARATOR_LINE;
    [self addSubview:self.separatorLine];
}

@end
