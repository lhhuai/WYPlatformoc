//
//  NSString+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSString+WYAddition.h"
#import "NSData+WYAddition.h"

@implementation NSString (WYAddition)

+ (NSString *)wy_wrapNilString:(NSString *)string {
    if (string == nil) {
        string = @"";
    }
    
    return string;
}

+ (NSString *)wy_sepreateMobilNum:(NSString *)mobilNum {
    NSString *newNum;
    if (mobilNum.length >= 11) {
        newNum = [NSString stringWithFormat:@"%@ %@ %@"
                  , [mobilNum substringWithRange:NSMakeRange(0, 3)]
                  , [mobilNum substringWithRange:NSMakeRange(3, 4)]
                  , [mobilNum substringWithRange:NSMakeRange(7, 4)]];
    }
    return newNum;
}

- (BOOL)wy_isNumberic {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    NSNumber *num = [formatter numberFromString:self];
    
    return num != nil;
}

- (NSString *)wy_stringByURLEncoding {
//    NSString *escapedString = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
//                                                                                                    NULL,
//                                                                                                    (CFStringRef)self,
//                                                                                                    NULL,
//                                                                                                    CFSTR("!*'();:@&=+$,/?%#[]"),
//                                                                                                    kCFStringEncodingUTF8);
    NSString *escapedString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"].invertedSet];
    return escapedString;
}

- (NSData *)wy_dataByRestoringHexRepresentation {
    NSString *theString = [[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
    
    NSMutableData *data = [NSMutableData data];
    for (NSInteger idx = 0; idx + 2 <= theString.length; idx += 2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString *hexStr = [theString substringWithRange:range];
        NSScanner *scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        if ([scanner scanHexInt:&intValue]) {
            [data appendBytes:&intValue length:1];
        }
    }
    
    return data;
}

- (NSString *)wy_stringByEncryptingUsingMD5 {
    return [[[self dataUsingEncoding:NSUTF8StringEncoding] wy_dataByEncryptingUsingMD5] wy_hexRepresentation];
}

- (NSString *)sf_stringByStrippingHTMLTags {
    NSMutableString *ms = [NSMutableString string];
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner setCharactersToBeSkipped:nil];
    NSString *s = nil;
    while (![scanner isAtEnd]) {
        [scanner scanUpToString:@"<" intoString:&s];
        if (s != nil)
            [ms appendString:s];
        [scanner scanUpToString:@">" intoString:NULL];
        if (![scanner isAtEnd])
            [scanner setScanLocation:[scanner scanLocation]+1];
        s = nil;
    }
    NSMutableDictionary *replaceSet = [NSMutableDictionary dictionary];
    [replaceSet setObject:@"" forKey:@"&hellip;"];
    [replaceSet setObject:@" " forKey:@"&nbsp;"];
    [replaceSet setObject:@"" forKey:@"&ldquo;"];
    [replaceSet setObject:@"" forKey:@"&rdquo;"];
    [replaceSet setObject:@"\"" forKey:@"&#39;"];
    [replaceSet setObject:@"" forKey:@"&mdash;"];
    [replaceSet setObject:@"" forKey:@"&amp;"];
    [replaceSet setObject:@"" forKey:@"&rsquo;"];
    [replaceSet setObject:@"\"" forKey:@"&quot;"];
    [replaceSet setObject:@"·" forKey:@"&middot;"];
    
    NSString *result = ms;
    NSArray *allKeys = [replaceSet allKeys];
    for (NSString *key in allKeys) {
        result = [result stringByReplacingOccurrencesOfString:key withString:[replaceSet objectForKey:key]];
    }
    
    return result;
}

/**
 *  @brief 将unicode转换成字符
 *
 *  @warning unicode字符\U00A5(@"\\U00A5") 必须摇对\进行转义
 *
 *  @return 可显示字符
 *
 *  @code [@"\\U00A5" unicodeStringConvertToString];
 */
- (NSString *)wy_unicodeStringConvertToString {
    NSString *upperString = [self stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *escapeQuot = [upperString stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *quotString = [[@"\""stringByAppendingString:escapeQuot] stringByAppendingString:@"\""];
    NSData *unicodeData = [quotString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:unicodeData options:NSPropertyListImmutable format:NULL error:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

- (NSString *)wy_stringByInsertSuffixWithSize:(CGSize)size {
    NSString *pathExtension = [self pathExtension];
    NSString *basePath = [self stringByDeletingPathExtension];
    
    CGFloat scale = [UIScreen mainScreen].scale;
    NSString *suffixString = [NSString stringWithFormat:@"%.0fx%.0f", size.width*scale, size.height*scale];
    return [[basePath stringByAppendingPathComponent:suffixString] stringByAppendingPathExtension:pathExtension];
}

@end
