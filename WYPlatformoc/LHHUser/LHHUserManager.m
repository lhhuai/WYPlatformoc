//
//  LHHUserManager.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/8.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHUserManager.h"
#import <FMDB.h>

@interface LHHUserManager()

@property (nonatomic, strong) FMDatabaseQueue *databaseQueue;

@end

@implementation LHHUserManager

+ (instancetype)shareInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (id)init {
    self = [super init];
    
    
    
    return self;
}

- (BOOL)insertUser:(LHHUser *)user {
    
    return false;
}

- (LHHUser *)userWithAccount:(NSString *)account {
    
    return nil;
}

- (void)dealloc {
    [self.databaseQueue close];
}

@end
