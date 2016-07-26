//
//  NSString+WYUIAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WYUIAddition)

- (CGSize)wy_sizeWithFont:(UIFont *)font;
- (CGSize)wy_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)constrainedToSize;

- (UIFont *)wy_fontByFitingWithViewSize:(CGSize)viewSize fromFont:(UIFont *)fromFont stepFontDelta:(CGFloat)stepFontDelta;
//- (UIImage *)wy_imageWithFont:(UIFont *)font textColor:(UIColor *)textColor;

+ (int)wy_heightWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color width:(int)width;

@end
