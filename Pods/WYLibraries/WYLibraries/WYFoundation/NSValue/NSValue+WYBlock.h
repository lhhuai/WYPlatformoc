//
//  NSValue+WYBlock.h
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValue (WYBlock)

+ (instancetype)wy_valueWithBlock:(id)block;
- (id)wy_block;

@end
