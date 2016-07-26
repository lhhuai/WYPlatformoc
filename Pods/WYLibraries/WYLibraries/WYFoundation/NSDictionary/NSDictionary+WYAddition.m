//
//  NSDictionary+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSDictionary+WYAddition.h"

#import "NSString+WYJavaLikeStringHandle.h"
#import "NSString+WYAddition.h"

@implementation NSDictionary (WYAddition)

- (id)wy_dictionaryWithPath:(NSString *)path {
    NSDictionary *dictionary = self;
    
    NSArray *paths = [path componentsSeparatedByString:@"."];
    for (NSString *tmpPath in paths) {
        NSString *tmpNoWhitespacePath = [tmpPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (tmpNoWhitespacePath.length != 0) {
            if ([dictionary isKindOfClass:[NSDictionary class]]) {
                NSString *key = tmpNoWhitespacePath;
                NSString *arrayIndexPath = nil;
                NSInteger arrayIndexPathBeginIndex = 0;
                BOOL errorArrayIndexFormat = NO;
                if ((arrayIndexPathBeginIndex = [tmpNoWhitespacePath wy_find:@"["]) != -1) {
                    key = [tmpNoWhitespacePath substringToIndex:arrayIndexPathBeginIndex];
                    NSInteger arrayIndexPathEndIndex = [tmpNoWhitespacePath wy_find:@"]" fromIndex:++arrayIndexPathBeginIndex];
                    if (arrayIndexPathEndIndex != -1) {
                        arrayIndexPath = [tmpNoWhitespacePath wy_substringWithBeginIndex:arrayIndexPathBeginIndex endIndex:arrayIndexPathEndIndex];
                        if (![arrayIndexPath wy_isNumberic]) {
                            errorArrayIndexFormat = YES;
                        }
                    }
                }
                if (!errorArrayIndexFormat) {
                    dictionary = [dictionary objectForKey:key];
                    if (arrayIndexPath.length != 0) {
                        if ([dictionary isKindOfClass:[NSArray class]]) {
                            NSArray *array = (id)dictionary;
                            NSInteger index = [arrayIndexPath integerValue];
                            if (index < array.count) {
                                dictionary = [array objectAtIndex:index];
                            } else {
                                NSLog(@"Warning: path(%@) is out of bounds(index:%ld, array count:%ld) at array index:%@", path, (long)index, (long)array.count, tmpNoWhitespacePath);
                                dictionary = nil;
                            }
                        } else {
                            NSLog(@"Warning: path(%@) is invalid at array index:%@", path, tmpNoWhitespacePath);
                            dictionary = nil;
                        }
                    }
                } else {
                    NSLog(@"Warning: path(%@) encounter invalid array index:%@", path, tmpNoWhitespacePath);
                }
            } else {
                dictionary = nil;
                break;
            }
        }
    }
    
    return dictionary;
}

- (instancetype)wy_combineWithKeysAndValues:(id)firstKey, ... {
    NSMutableDictionary *keyParamNameValueParamValue = [NSMutableDictionary dictionaryWithDictionary:self];
    
    va_list params;
    va_start(params, firstKey);
    
    id currentKey = nil;
    NSInteger i = 0;
    for (NSString *tmpParam = firstKey; (id)tmpParam != [WYCombinationEnd end]; tmpParam = va_arg(params, NSString *), ++i) {
        if (i % 2 == 0) {
            currentKey = tmpParam;
        } else {
            NSString *value = tmpParam;
            if (currentKey == nil) {
                continue;
            }
            if (value == nil || (id)value == [NSNull null]) {
                value = @"";
            }
            [keyParamNameValueParamValue setObject:value forKey:currentKey];
            currentKey = nil;
        }
    }
    
    va_end(params);
    
    return keyParamNameValueParamValue;
}

@end
