//
//  LHHLoginTableViewCell.m
//  LHHOCStudy
//
//  Created by seaphy on 16/3/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHLoginTableViewCell.h"
#import "LHHCommonDefines.h"
#import "LHHCommonColors.h"

@interface LHHLoginTableViewCell()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *separatorLine;

@end

@implementation LHHLoginTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 80, 20)];
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.label];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(95, 10, SCREEN_WIDTH - 95 - 10, 20)];
    self.textField.font = [UIFont systemFontOfSize:13];
    self.textField.delegate = self;
    [self addSubview:self.textField];
    
    self.separatorLine = [[UILabel alloc]initWithFrame:CGRectMake(14, 36, self.bounds.size.width - 14, 0.5)];
    self.separatorLine.backgroundColor = RGBCOLOR(239, 239, 239);
    [self addSubview:self.separatorLine];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(cellTextFieldDidEndEditing:)]) {
        [self.delegate cellTextFieldDidEndEditing:self];
    }
}

@end
