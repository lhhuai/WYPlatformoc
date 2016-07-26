//
//  NSString+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WYAddition)

+ (NSString *)wy_wrapNilString:(NSString *)string;
+ (NSString *)wy_sepreateMobilNum:(NSString *)mobilNum;

- (BOOL)wy_isNumberic;
- (NSString *)wy_stringByURLEncoding;
- (NSData *)wy_dataByRestoringHexRepresentation;

- (NSString *)wy_unicodeStringConvertToString;
- (NSString *)wy_stringByInsertSuffixWithSize:(CGSize)size;

@end
