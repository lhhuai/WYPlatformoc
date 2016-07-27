//
//  LHHUserManager.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/8.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHUserManager.h"
#import "FMDB.h"
#import <WYLibraries/NSDate+WYAddition.h>

#define NotNullString(str)  (str == nil ? @"" : str)

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
    
    if (self) {
        [self openDatabase];
        [self createTableOfUser];
    }
    
    return self;
}

- (BOOL)insertUser:(LHHUser *)user {
    LHHUser *existUser = [self userWithAccount:user.account];
    
    if (!existUser) {
        NSString *createTime = [[NSDate date] wy_yyyyMMddHHmmss_timeString];
        NSString *const insertSql = @"insert into user(account, username, password, createtime) values(?, ?, ?, ?)";
        [self executeQuery:insertSql arguments:@[NotNullString(user.account), NotNullString(user.userName), NotNullString(user.password), NotNullString(createTime)]];
        
        return true;
    } else {
        return false;
    }
}

- (LHHUser *)userWithAccount:(NSString *)account {
    NSString *const user_sql = @"select * from user where account = ?";
    NSArray *userArray = [self executeQuery:user_sql arguments:@[account]];
    for (NSDictionary *userDic in userArray) {
        LHHUser *user = [LHHUser new];
        user.account = userDic[@"account"];
        user.userName = userDic[@"username"];
        user.password = userDic[@"password"];
        return user;
    }
    return nil;
}

- (void)createTableOfUser {
    NSString *userSql = @"create table if not exists user(id integer primary key autoincrement, account varchar(50) unique, username varchar(100), password varchar(20), createtime datetime)";
    [self executeQuery:userSql arguments:nil];
}

- (void)openDatabase {
    NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *databasePath = [docsPath stringByAppendingPathComponent:@"user.sqlite"];
    self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
}

- (NSArray *)executeQuery:(NSString *)sql arguments:(NSArray *)arguments {
    __block NSArray *results = nil;
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:sql withArgumentsInArray:arguments];
        NSMutableArray *resultArray = [NSMutableArray array];
        while ([resultSet next]) {
            [resultArray addObject:[resultSet resultDictionary]];
        }
        results = resultArray;
    }];
    return results;
}

- (void)dealloc {
    [self.databaseQueue close];
}

@end
