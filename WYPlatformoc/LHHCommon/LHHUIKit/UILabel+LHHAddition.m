//
//  UILabel+LHHAddition.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/30.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "UILabel+LHHAddition.h"

@implementation UILabel (LHHAddition)

+(instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [[UILabel alloc]init];
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    
    return label;
}

@end
