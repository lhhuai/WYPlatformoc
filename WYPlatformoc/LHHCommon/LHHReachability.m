//
//  LHHReachability.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/29.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHReachability.h"
#import <CoreLocation/CLLocationManager.h>

@interface LHHReachability()

@end

static LHHReachability *instance = nil;

@implementation LHHReachability

+ (LHHReachability *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LHHReachability alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    self.reach = nil;
}

- (void)startMonifier {
    if (!self.reach) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reachabilityChanged:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        self.reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    }
    [self.reach startNotifier];
}

- (void)stopMonifier {
    [self.reach stopNotifier];
}

- (void)reachabilityChanged:(NSNotification *)notification {
    Reachability *reach = [notification object];
    NetworkStatus status = [reach currentReachabilityStatus];
    switch (status) {
        case ReachableViaWiFi:
        {
            NSLog(@"NetworkStatus is WiFi");
            break;
        }
        case ReachableViaWWAN:
        {
            NSLog(@"NetworkStatus is 2G/3G");
            break;
        }
        case NotReachable:
        {
            NSLog(@"Notification Says Unreachable");
            [self netUnavailableAlert];
            break;
        }
        default:
            break;
    }
}

- (void)netUnavailableAlert {
    if ([CLLocationManager locationServicesEnabled]) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [locationManager startUpdatingLocation];
    }
}

- (NetworkStatus)networkStatus {
    return [self.reach currentReachabilityStatus];
}

- (BOOL)isNetAvailable {
    return [self networkStatus] != NotReachable;
}

@end
