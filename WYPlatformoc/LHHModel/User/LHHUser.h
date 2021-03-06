//
//  LHHUser.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/8.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LHHKEYACCOUNT               @"KeyAccount"
#define LHHKEYUSERNAME              @"KeyUsername"
#define LHHKEYPASSWORD              @"KeyPassword"

@interface LHHUser : NSObject<NSCoding>

@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;

@end
