//
//  NSData+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSData+WYAddition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (WYAddition)

- (NSString *)wy_hexRepresentation {
    const unsigned char *bytes = (unsigned char *)[self bytes];
    NSMutableString *hexString = [NSMutableString string];
    for (NSInteger i = 0; i < [self length]; ++i) {
        [hexString appendFormat:@"%02x", bytes[i]];
    }
    
    return [NSString stringWithFormat:@"%@", hexString];
}

- (NSData *)wy_dataByEncryptingUsingMD5 {
    unsigned char result[16];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    
    return [NSData dataWithBytes:result length:16];
}

@end
