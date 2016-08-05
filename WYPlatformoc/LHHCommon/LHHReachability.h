//
//  LHHReachability.h
//  WYPlatformoc
//
//  Created by seaphy on 16/7/29.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface LHHReachability : NSObject

@property (nonatomic, strong) Reachability *reach;
@property (nonatomic, assign) BOOL isNetAvailable;

+ (LHHReachability *)sharedInstance;

- (void)startMonifier;
- (void)stopMonifier;
- (NetworkStatus)networkStatus;
- (void)netUnavailableAlert;

@end
