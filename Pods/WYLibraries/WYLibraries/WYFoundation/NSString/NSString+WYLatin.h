//
//  NSString+WYLatin.h
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WYLatin)

- (NSString *)wy_firstPinyin;
- (NSString *)wy_pinyin;
- (NSString *)wy_firstPinyins;

- (NSString *)wy_stringConvertToLaTin;
- (NSString *)wy_stringConvertToInitalLaTin;//转化成首字母

@end
