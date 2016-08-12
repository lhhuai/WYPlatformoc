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
#import "UIView+WYLayout.h"

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
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(WY_SIZE(21), 0, WY_SIZE(90), HeightForLoginTableViewCell)];
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.font = WY_FONT_16;
    [self addSubview:self.label];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(self.label.right + WY_SIZE(5), 0, SCREEN_WIDTH - self.label.right - WY_SIZE(21), HeightForLoginTableViewCell)];
    self.textField.font = WY_FONT_16;
    self.textField.delegate = self;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:self.textField];
    
    self.separatorLine = [[UILabel alloc]initWithFrame:CGRectMake(WY_SIZE(21), HeightForLoginTableViewCell - WY_SIZE(.5), SCREEN_WIDTH - WY_SIZE(21), WY_SIZE(.5))];
    self.separatorLine.backgroundColor = COLOR_SEPARATOR_LINE;
    [self addSubview:self.separatorLine];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChanged:) name:UITextFieldTextDidChangeNotification object:self.textField];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldTextDidChanged:(NSNotification *)notification {
    if ([self.delegate respondsToSelector:@selector(cellTextFieldTextDidChanged:)]) {
        [self.delegate cellTextFieldTextDidChanged:self];
    }
}

//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    if ([self.delegate respondsToSelector:@selector(cellTextFieldDidEndEditing:)]) {
//        [self.delegate cellTextFieldDidEndEditing:self];
//    }
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(cellTextFieldShouldReturn:)]) {
        [self.delegate cellTextFieldShouldReturn:self];
    }
    
    [textField resignFirstResponder];
    return YES;
}

@end
