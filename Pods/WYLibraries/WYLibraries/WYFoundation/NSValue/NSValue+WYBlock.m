
//
//  NSValue+WYBlock.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSValue+WYBlock.h"

@interface WYBlockWrapper : NSValue

@property (nonatomic, copy, readonly) id block;

+ (instancetype)wrapperWithBlock:(id)block;

@end

@interface WYBlockWrapper ()

@property (nonatomic, copy) id block;

@end

@implementation WYBlockWrapper

+ (instancetype)wrapperWithBlock:(id)block {
    WYBlockWrapper *wrapper = [WYBlockWrapper new];
    wrapper.block = block;
    
    return wrapper;
}

@end

@implementation NSValue (WYBlock)

+ (instancetype)wy_valueWithBlock:(id)block {
    return [WYBlockWrapper wrapperWithBlock:block];
}

- (id)wy_block {
    id block = nil;
    
    if ([self isKindOfClass:[WYBlockWrapper class]]) {
        block = ((WYBlockWrapper *)self).block;
    }
    
    return block;
}

@end
