//
//  NSString+WYLatin.m
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSString+WYLatin.h"

@implementation NSString (WYLatin)

- (NSString *)wy_firstPinyin {
    if (self.length) {
        CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (CFStringRef)self);
        CFStringTransform(string, NULL, kCFStringTransformToLatin, NO);
        if (string) {
            NSString *first = [[(__bridge_transfer NSString *)string substringToIndex:1] uppercaseString];
            return first;
        }
        CFRelease(string);
    }
    
    return @"";
}

- (NSString *)wy_pinyin {
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (CFStringRef)self);
    CFStringTransform(string, NULL, kCFStringTransformToLatin, NO);
    CFStringTransform(string, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    NSString *pinyin = (__bridge_transfer NSString *)string;
    pinyin = [[pinyin componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] componentsJoinedByString:@""];
    
    CFRelease(string);
    
    return pinyin;
}

- (NSString *)wy_firstPinyins {
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (CFStringRef)self);
    CFStringTransform(string, NULL, kCFStringTransformToLatin, NO);
    CFStringTransform(string, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    NSString *pinyin = (__bridge_transfer NSString *)string;
    NSArray *pinyins = [pinyin componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableString *firstPinyins = [NSMutableString string];
    for (NSString *tmpPinyin in pinyins) {
        [firstPinyins appendString:[tmpPinyin substringToIndex:1]];
    }
    
    CFRelease(string);
    
    return firstPinyins;
}

/**
 *  返回输入中文的拼音
 *  @param cityName 中文字符
 *  @return 中文拼音
 */
- (NSString *)wy_stringConvertToLaTin {
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (__bridge CFStringRef)self);
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);   // 中文转换成拼音
    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO); // 除去拼音的音标
    
    NSString *latinString = (__bridge NSString *)(string);
    latinString = [latinString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%c", 32] withString:@""];  //除去空格
    CFRelease(string);
    
    return latinString;
}

-(NSString *)wy_stringConvertToInitalLaTin {
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (__bridge CFStringRef)self);
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);   // 中文转换成拼音
    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO); // 除去拼音的音标
    
    NSString *latinString = (__bridge NSString *)(string);
    NSArray *alphabetArray=[latinString componentsSeparatedByString:([NSString stringWithFormat:@"%c", 32])];
    NSMutableString *alphabetStr=[[NSMutableString alloc]init];
    
    for (NSString *item in alphabetArray)
    {
        [alphabetStr appendString:[item substringWithRange:(NSMakeRange(0, 1))]];
    }
    
    CFRelease(string);
    return alphabetStr;
}

@end
