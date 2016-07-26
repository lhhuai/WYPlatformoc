//
//  NSDictionary+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WYCombinationEnd.h"

// Make a dictionary with key and value as parameters, the key and value can be nil,
//
// Example:
// WYDictionaryMake(@"name", @"seaphy", @"age", @27, @"intro" , nil, @"address" , @"CN");
// equals:
// @{
//  @"name" : @"seaphy"
//  , @"age" : @27
//  , @"intro" : @""
//  , @"address" : @"CN"
//  }
//
// Returns a dictionary with given keys and values.
#define WYDictionaryMake(key, ...) \
[[NSDictionary dictionary] wy_combineWithKeysAndValues:key, __VA_ARGS__, [WYCombinationEnd end]]

@interface NSDictionary (WYAddition)

// Find target dictionary using path.
//
// Example:
// @{@"root" : @{@"dict" : @{@"key" : @"value"}}, @"array" : @[@{@"key1" : @"value1"}, @{@"key2" : @"value2"}]}
// 1.Path root.dict get the dictionary:@{@"key" : @"value"}
// 2.Path array[1] get the dictionary:@{@"key2" : @"value2"}
//
// Returns a dictionary matchting to the given path.
- (id)wy_dictionaryWithPath:(NSString *)path;

// Combines dictionary with keys and values
//
// Example:
// NSDictionary *params = [NSDictionary dictionary];
// params = [params HTTPParams:@"param1" , @"param1_value", @"param2" : @"param2_value", @"nilKey", nil, [SFCombinationEnd end]];
//
// Returns a dictionary with all keys and values.
- (instancetype)wy_combineWithKeysAndValues:(id)firstKey, ...;

@end
