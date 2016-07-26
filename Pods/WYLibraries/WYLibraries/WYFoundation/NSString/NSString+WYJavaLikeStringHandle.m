//
//  NSString+WYJavaLikeStringHandle.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSString+WYJavaLikeStringHandle.h"

@implementation NSString (WYJavaLikeStringHandle)

- (NSString *)wy_substringWithBeginIndex:(NSInteger)beginIndex endIndex:(NSInteger)endIndex {
    if (endIndex >= beginIndex && endIndex <= self.length) {
        return [self substringWithRange:NSMakeRange(beginIndex, endIndex - beginIndex)];
    }
    
    return nil;
}

- (NSInteger)wy_find:(NSString *)str fromIndex:(NSInteger)fromInex reverse:(BOOL)reverse {
    
    return [self wy_find:str fromIndex:fromInex reverse:reverse caseSensitive:NO];
}

- (NSInteger)wy_find:(NSString *)str fromIndex:(NSInteger)fromInex reverse:(BOOL)reverse caseSensitive:(BOOL)caseSensitive {
    if (fromInex > self.length) {
        return -1;
    }
    NSRange searchRange = reverse ? NSMakeRange(0, fromInex) : NSMakeRange(fromInex, self.length - fromInex);
    NSStringCompareOptions options = (caseSensitive ? NSLiteralSearch : NSCaseInsensitiveSearch);
    if (reverse) {
        options |= NSBackwardsSearch;
    }
    NSRange range = [self rangeOfString:str
                                options:options
                                  range:searchRange];
    
    return range.location == NSNotFound ? -1 : range.location;
}

- (NSInteger)wy_find:(NSString *)str fromIndex:(NSInteger)fromInex {
    return [self wy_find:str fromIndex:fromInex reverse:NO];
}

- (NSInteger)wy_find:(NSString *)str {
    return [self wy_find:str fromIndex:0];
}

@end
