//
//  NSMutableDictionary+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (WYAddition)

- (void)wy_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
