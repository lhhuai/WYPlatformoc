//
//  NSString+WYRichText.m
//  WYLibraries
//
//  Created by seaphy on 16/5/11.
//  Copyright © 2016年 seaphyliu. All rights reserved.
//

#import "NSString+WYRichText.h"

/// 有行间距计算多行Label的高度
#define WY_MULTILINE_TEXTSIZE_MARGIN(text, font, maxSize, mode) [text length] > 0 ? [text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName: paragraphStyle} context:nil].size : CGSizeZero;

@implementation NSString (WYRichText)

/// 更改一段文字String为行间距为lineSpacing的富文本
- (NSAttributedString *)generateRichTextWithLineSpacing:(CGFloat)lineSpacing {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
    return attributeString;
}

/// 计算设置为富文本形式的文字的高度
- (CGSize)calculateStringSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    CGSize size = WY_MULTILINE_TEXTSIZE_MARGIN(self, font, maxSize, 0);
    return size;
}

@end
