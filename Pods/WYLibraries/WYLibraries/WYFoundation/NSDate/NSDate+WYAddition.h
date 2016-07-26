//
//  NSDate+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WYAddition)

// yyyy-MM-dd HH:mm:ss
- (NSString *)wy_yyyyMMddHHmmss_timeString;

- (NSString *)wy_timeStringWithFormat:(NSString *)format;

- (NSDate *)wy_zeroHourDate;

- (NSDate *)wy_monthBeginDate;

- (NSDate *)wy_dateByAddingNumberOfDays:(NSInteger)numberOfDays;

- (NSInteger)wy_numberOfDayIntervalsByComparingWithDate:(NSDate *)date usingZeroHourDate:(BOOL)usingZeroHourDate;

- (NSInteger)wy_numberOfDayIntervalsWithDate:(NSDate *)date usingZeroHourDate:(BOOL)usingZeroHourDate;

- (NSDateComponents *)wy_componentsUsingCurrentCalendar;

@end
