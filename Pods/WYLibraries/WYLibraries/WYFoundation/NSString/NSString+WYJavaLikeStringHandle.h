//
//  NSString+WYJavaLikeStringHandle.h
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WYJavaLikeStringHandle)

- (NSString *)wy_substringWithBeginIndex:(NSInteger)beginIndex endIndex:(NSInteger)endIndex;
- (NSInteger)wy_find:(NSString *)str fromIndex:(NSInteger)fromInex reverse:(BOOL)reverse caseSensitive:(BOOL)caseSensitive;
- (NSInteger)wy_find:(NSString *)str fromIndex:(NSInteger)fromInex reverse:(BOOL)reverse;
- (NSInteger)wy_find:(NSString *)str fromIndex:(NSInteger)fromInex;
- (NSInteger)wy_find:(NSString *)str;

@end
