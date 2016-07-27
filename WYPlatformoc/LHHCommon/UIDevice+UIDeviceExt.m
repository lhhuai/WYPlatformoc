//
//  UIDevice+UIDeviceExt.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "UIDevice+UIDeviceExt.h"
#include <sys/sysctl.h>

#include <sys/types.h>
#include <ifaddrs.h>
#include <net/if.h>
#include <netdb.h>

//#import "OpenUDID.h"

#import <CommonCrypto/CommonDigest.h>

@implementation UIDevice (UIDeviceExt)

+ (NSString *)deviceCode {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return @"3";
    } else {
        return @"2";
    }
}

+ (NSString *)deviceModel {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *model = malloc(size);
    sysctlbyname("hw.machine", model, &size, NULL, 0);
    NSString *deviceModel = [NSString stringWithCString:model encoding:NSUTF8StringEncoding];
    free(model);
    return deviceModel;
}

+ (NSString *)deviceName {
    NSString *deviceModel = [UIDevice deviceModel];
    
    if ([deviceModel isEqualToString:@"i386"])          return @"Simulator";
    if ([deviceModel isEqualToString:@"iPhone1,1"])     return @"iPhone1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])     return @"iPhone3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])     return @"iPhone3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"]
        || [deviceModel isEqualToString:@"iPhone3,2"]
        || [deviceModel isEqualToString:@"iPhone3,3"])  return @"iPhone4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])     return @"iPhone4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"]
        || [deviceModel isEqualToString:@"iPhone5,2"])  return @"iPhone5";
    
    if ([deviceModel hasPrefix:@"iPhone"]) {
        return @"iPhone";
    }
    
    if ([deviceModel isEqualToString:@"iPod1,1"])       return @"iPod1";
    if ([deviceModel isEqualToString:@"iPod2,1"])       return @"iPod2";
    if ([deviceModel isEqualToString:@"iPod3,1"])       return @"iPod3";
    if ([deviceModel isEqualToString:@"iPod4,1"])       return @"iPod4";
    if ([deviceModel isEqualToString:@"iPod5,1"])       return @"iPod5";
    
    if ([deviceModel hasPrefix:@"iPod"]) {
        return @"iPod";
    }
    
    if ([deviceModel isEqualToString:@"iPad1,1"]
        || [deviceModel isEqualToString:@"iPad1,2"])    return @"iPad1";
    
    if ([deviceModel isEqualToString:@"iPad2,1"]
        || [deviceModel isEqual:@"iPad2,2"]
        || [deviceModel isEqualToString:@"iPad2,3"])    return @"iPad2";
    
    if ([deviceModel isEqualToString:@"iPad3,1"]
        || [deviceModel isEqualToString:@"iPad3,2"]
        || [deviceModel isEqualToString:@"iPad3,3"])    return @"iPad3";
    
    if ([deviceModel isEqualToString:@"iPad3,4"])       return @"iPad4";
    
    if ([deviceModel hasPrefix:@"iPad"]) {
        return @"iPad";
    }
    
    //If none was found, send the original string
    return deviceModel;
}

+ (NSString *)deviceNameWithDeviceModel:(BOOL)shouldIncludeDeviceModel {
    if (shouldIncludeDeviceModel) {
        return [NSString stringWithFormat:@"%@ (%@)", [UIDevice deviceName], [UIDevice deviceModel]];
    }
    
    return [UIDevice deviceName];
}

+ (BOOL)isRetina4inch{
    return (568 == SCREEN_HEIGHT && 320 == SCREEN_WIDTH) || (1136 == SCREEN_HEIGHT && 640 == SCREEN_WIDTH);
}

+ (BOOL)isPhone5 {
    if (PHONE5_HEIGHT == SCREEN_HEIGHT && PHONE5_WIDTH == SCREEN_WIDTH) {
        return YES;
    }
    return NO;
}

+ (BOOL)isPhone6 {
    if (PHONE6_WIDTH == SCREEN_WIDTH) {
        return YES;
    }
    return NO;
}

+ (BOOL)isPhone6p {
    if (PHONE6P_WIDTH == SCREEN_WIDTH) {
        return YES;
    }
    return NO;
}



+ (NSString *)UDID16 {
    return @"";
//    NSString *str = [OpenUDID value];
//    
//    const char *cStr = [str UTF8String];
//    unsigned char digest[ CC_MD5_DIGEST_LENGTH ];
//    CC_MD5 ( cStr, strlen (cStr), digest );
//    NSMutableString *result = [ NSMutableString stringWithCapacity : CC_MD5_DIGEST_LENGTH * 2 ];
//    for ( int i = 0 ; i < CC_MD5_DIGEST_LENGTH ; i++)
//        [result appendFormat : @"%02x" , digest[i]];
//    
//    // 提取 32 位 MD5 散列的中间 16 位
//    result = (NSMutableString *)[[result substringToIndex:24] substringFromIndex:8]; // 即 9 ～ 25 位
//    return result;
}
+ (NSString*)UDID
{
    return @"";
//    return [OpenUDID value];
}

+ (NSArray *)localIPAddresses
{
    NSMutableArray *ipAddresses = [NSMutableArray array] ;
    struct ifaddrs *allInterfaces;
    
    // Get list of all interfaces on the local machine:
    if (getifaddrs(&allInterfaces) == 0) {
        struct ifaddrs *interface;
        
        // For each interface ...
        for (interface = allInterfaces; interface != NULL; interface = interface->ifa_next) {
            unsigned int flags = interface->ifa_flags;
            struct sockaddr *addr = interface->ifa_addr;
            
            // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
            if ((flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING)) {
                if (addr->sa_family == AF_INET || addr->sa_family == AF_INET6) {
                    
                    // Convert interface address to a human readable string:
                    char host[NI_MAXHOST];
                    getnameinfo(addr, addr->sa_len, host, sizeof(host), NULL, 0, NI_NUMERICHOST);
                    
                    [ipAddresses addObject:[[NSString alloc] initWithUTF8String:host]];
                }
            }
        }
        
        freeifaddrs(allInterfaces);
    }
    
    return ipAddresses;
}

@end
