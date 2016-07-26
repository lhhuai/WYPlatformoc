//
//  NSObject+WYObjectAssociation.m
//  WYLibraries
//
//  Created by seaphy on 16/5/18.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSObject+WYObjectAssociation.h"
#import <objc/runtime.h>

static const char *WYObjectDictionary = "WYObjectDictionary";

@implementation NSObject (WYObjectAssociation)

- (NSMutableDictionary *)shared_ObjectDictionary {
    NSMutableDictionary *objectDictionary = objc_getAssociatedObject(self, WYObjectDictionary);
    if (objectDictionary == nil) {
        objectDictionary = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, WYObjectDictionary, objectDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return objectDictionary;
}

- (NSDictionary *)wy_associatedObjects {
    return [[self shared_ObjectDictionary] copy];
}

- (id)wy_associatedObjectWithKey:(NSString *)key {
    return [[self shared_ObjectDictionary] objectForKey:key];
}

- (void)wy_setAssociatedObject:(id)object key:(NSString *)key {
    if (object == nil) {
        [[self shared_ObjectDictionary] removeObjectForKey:key];
    } else {
        [[self shared_ObjectDictionary] setObject:object forKey:key];
    }
}

- (void)wy_removeAssociatedObjectWithKey:(NSString *)key {
    [self wy_setAssociatedObject:nil key:key];
}

@end
