//
//  NSString+WYUIAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSString+WYUIAddition.h"
//#import "UIView+WYAddition.h"
#import <CoreText/CoreText.h>

@implementation NSString (WYUIAddition)

- (CGSize)wy_sizeWithFont:(UIFont *)font {
    CGSize size = CGSizeZero;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f) {
        NSDictionary *attributes = @{NSFontAttributeName : font};
#ifdef __IPHONE_7_0
        size = [self sizeWithAttributes:attributes];
        size.width = ceilf(size.width);
        size.height = ceilf(size.height);
#endif
    } else {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        size = [self sizeWithFont:font];
#pragma GCC diagnostic pop
    }
    
    return size;
}

- (CGSize)wy_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)constrainedToSize {
    CGSize size = CGSizeZero;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f) {
        NSDictionary *attributes = @{NSFontAttributeName : font};
#ifdef __IPHONE_7_0
        size = [self boundingRectWithSize:constrainedToSize
                                  options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                               attributes:attributes
                                  context:nil].size;
        size.width = ceilf(size.width);
        size.height = ceilf(size.height);
#endif
    } else {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        size = [self sizeWithFont:font constrainedToSize:constrainedToSize];
#pragma GCC diagnostic pop
    }
    
    return size;
}

- (UIFont *)wy_fontByFitingWithViewSize:(CGSize)viewSize fromFont:(UIFont *)fromFont stepFontDelta:(CGFloat)stepFontDelta {
    UIFont *font = fromFont;
    NSString *string = self;
    CGSize size = CGSizeMake(viewSize.width, MAXFLOAT);
    while ([string wy_sizeWithFont:font constrainedToSize:size].height > viewSize.height) {
        UIFont *nextFont = [UIFont systemFontOfSize:font.pointSize - stepFontDelta];
        font = nextFont;
    }
    
    return font;
}

//- (UIImage *)wy_imageWithFont:(UIFont *)font textColor:(UIColor *)textColor {
//    CGSize textSize = [self wy_sizeWithFont:font];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height)];
//    label.backgroundColor = [UIColor clearColor];
//    label.opaque = NO;
//    label.textColor = textColor == nil ? [UIColor blackColor] : textColor;
//    label.font = font;
//    label.text = self;
//    
//    return [label wy_toImage];
//}

+ (int)wy_heightWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color width:(int)width {
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:string];
    [titleStr addAttribute:(NSString *)kCTForegroundColorAttributeName
                     value:(id)color.CGColor
                     range:NSMakeRange(0, string.length)];
    [titleStr addAttribute:(NSString *)kCTFontAttributeName
                     value:(id)CFBridgingRelease(CTFontCreateWithName((CFStringRef)font.fontName, font.pointSize, NULL))
                     range:NSMakeRange(0, string.length)];
    
    int total_height = 0;
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)titleStr);    //string 为要计算高度的NSAttributedString
    CGRect drawingRect = CGRectMake(0, 0, width, 1000);  //这里的高要设置足够大
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *) CTFrameGetLines(textFrame);
    
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    int line_y = (int) origins[[linesArray count] -1].y;  //最后一行line的原点y坐标
    
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    
    CTLineRef line = (__bridge CTLineRef) [linesArray objectAtIndex:[linesArray count]-1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 1000 - line_y + (int) descent +1;    //+1为了纠正descent转换成int小数点后舍去的值
    
    CFRelease(textFrame);
    
    return total_height;
    
}

@end
