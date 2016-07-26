//
//  NSString+WYRichText.h
//  WYLibraries
//
//  Created by seaphy on 16/5/11.
//  Copyright © 2016年 seaphyliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (WYRichText)

/// 更改一段文字String为行间距为lineSpacing的富文本
- (NSAttributedString *)generateRichTextWithLineSpacing:(CGFloat)lineSpacing;

/// 计算设置为富文本形式的文字的高度
- (CGSize)calculateStringSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize lineSpacing:(CGFloat)lineSpacing;

@end
