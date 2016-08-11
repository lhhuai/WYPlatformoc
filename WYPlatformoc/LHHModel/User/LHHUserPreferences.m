//
//  LHHUserPreferences.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/3.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHUserPreferences.h"

#define kLHHUserInfo                          @"LHHUserInfo"
#define kLHHIsLogin                           @"LHHIsLogin"

@implementation LHHUserPreferences

+ (LHHUserPreferences *)sharedInstance {
    static LHHUserPreferences *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LHHUserPreferences alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        self.isLogin = [self getIsLogin];
        self.user = [self unarchiveUser];
    }
    return self;
}

- (void)archiveUser:(LHHUser *)user {
    NSData *archiveData = [NSKeyedArchiver archivedDataWithRootObject:user];
    if (archiveData) {
        [[NSUserDefaults standardUserDefaults] setObject:archiveData forKey:kLHHUserInfo];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.user = user;
    }
}

- (LHHUser *)unarchiveUser {
    NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:kLHHUserInfo];
    LHHUser *user = nil;
    if (userData) {
        user = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    }
    if (user == nil) {
        user = [[LHHUser alloc] init];
    }
    return user;
}

- (BOOL)checkAccount:(NSString *)account password:(NSString *)password {
    LHHUser *user = [self unarchiveUser];
    if ([account isEqualToString:user.account] && [password isEqualToString:user.password]) {
        return YES;
    } else {
        return NO;
    }
}

- (void)saveIsLogin:(BOOL)isLogin {
    self.isLogin = isLogin;
    if (isLogin) {
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:kLHHIsLogin];
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:kLHHIsLogin];
    }
}

- (BOOL)getIsLogin {
    NSString *isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:kLHHIsLogin];
    if (isLogin == nil || [isLogin isEqualToString:@""] || [isLogin isEqualToString:@"NO"]) {
        return false;
    } else {
        return true;
    }
}

- (void)exitLogin {
    self.isLogin = NO;
    self.user = [LHHUser new];
    [self saveIsLogin:self.isLogin];
    [self archiveUser:self.user];
}

@end
