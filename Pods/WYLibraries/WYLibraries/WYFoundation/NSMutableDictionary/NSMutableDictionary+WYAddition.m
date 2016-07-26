//
//  NSMutableDictionary+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSMutableDictionary+WYAddition.h"

@implementation NSMutableDictionary (WYAddition)

- (void)wy_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
