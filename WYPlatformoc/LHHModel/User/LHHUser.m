//
//  LHHUser.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/8.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHUser.h"

@implementation LHHUser


#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.account forKey:LHHKEYACCOUNT];
    [aCoder encodeObject:self.userName forKey:LHHKEYUSERNAME];
    [aCoder encodeObject:self.password forKey:LHHKEYPASSWORD];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.account = [aDecoder decodeObjectForKey:LHHKEYACCOUNT];
        self.userName = [aDecoder decodeObjectForKey:LHHKEYUSERNAME];
        self.password = [aDecoder decodeObjectForKey:LHHKEYPASSWORD];
    }
    return self;
}

@end
