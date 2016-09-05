//
//  UILabel+LHHAddition.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/30.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LHHAddition)

+(instancetype)labelWithFont:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;

@end
