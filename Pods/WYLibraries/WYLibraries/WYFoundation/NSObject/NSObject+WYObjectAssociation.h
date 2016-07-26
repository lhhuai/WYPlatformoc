//
//  NSObject+WYObjectAssociation.h
//  WYLibraries
//
//  Created by seaphy on 16/5/18.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WYObjectAssociation)

- (NSDictionary *)wy_associatedObjects;

- (id)wy_associatedObjectWithKey:(NSString *)key;

- (void)wy_setAssociatedObject:(id)object key:(NSString *)key;

- (void)wy_removeAssociatedObjectWithKey:(NSString *)key;

@end
