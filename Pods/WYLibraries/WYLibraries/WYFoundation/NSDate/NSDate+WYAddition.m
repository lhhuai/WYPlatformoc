//
//  NSDate+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "NSDate+WYAddition.h"

@implementation NSDate (WYAddition)

- (NSString *)wy_yyyyMMddHHmmss_timeString {
    return [self wy_timeStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)wy_timeStringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:format];
    
    return [dateFormatter stringFromDate:self];
}

- (NSDate *)wy_zeroHourDate {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *dateString = [dateFormatter stringFromDate:self];
    NSDate *beginningOfDate = [dateFormatter dateFromString:dateString];
    
    return beginningOfDate;
}

- (NSDate *)wy_monthBeginDate {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM"];
    
    return [dateFormatter dateFromString:[dateFormatter stringFromDate:self]];
}

- (NSDate *)wy_dateByAddingNumberOfDays:(NSInteger)numberOfDays {
    return [self dateByAddingTimeInterval:numberOfDays * 86400];
}

- (NSInteger)wy_numberOfDayIntervalsByComparingWithDate:(NSDate *)date usingZeroHourDate:(BOOL)usingZeroHourDate {
    NSDate *date1 = self;
    NSDate *date2 = date;
    if (usingZeroHourDate) {
        date1 = [date1 wy_zeroHourDate];
        date2 = [date2 wy_zeroHourDate];
    }
    NSTimeInterval time1 = [date1 timeIntervalSince1970];
    NSTimeInterval time2 = [date2 timeIntervalSince1970];
    NSTimeInterval timeInterval = time1 - time2;
    
    NSInteger numberOfDays = timeInterval / 86400.0f;
    
    return numberOfDays;
}

- (NSInteger)wy_numberOfDayIntervalsWithDate:(NSDate *)date usingZeroHourDate:(BOOL)usingZeroHourDate {
    NSInteger numberOfDays = [self wy_numberOfDayIntervalsByComparingWithDate:date usingZeroHourDate:usingZeroHourDate];
    if (numberOfDays < 0) {
        numberOfDays = 0 - numberOfDays;
    }
    
    return numberOfDays;
}

// 两个日期间隔天数，未取整
- (NSInteger)wy_numberOfDayIntervalsByComparingWithDate:(NSDate *)date {
    return [self wy_numberOfDayIntervalsByComparingWithDate:date usingZeroHourDate:NO];
}

// 两个日期间隔天数，取整
- (NSInteger)wy_numberOfDayIntervalsWithDate:(NSDate *)date {
    return [self wy_numberOfDayIntervalsWithDate:date usingZeroHourDate:NO];
}

- (NSDateComponents *)wy_componentsUsingCurrentCalendar {
    NSCalendar *calender = [NSCalendar currentCalendar];
    return [calender components:NSCalendarUnitYear
            | NSCalendarUnitMonth
            | NSCalendarUnitDay
            | NSCalendarUnitHour
            | NSCalendarUnitMinute
            | NSCalendarUnitSecond
            | NSCalendarUnitWeekOfMonth
            | NSCalendarUnitEra
            | NSCalendarUnitWeekday
            | NSCalendarUnitWeekdayOrdinal
            | NSCalendarUnitQuarter
            | NSCalendarUnitWeekOfMonth
            | NSCalendarUnitWeekOfYear
            | NSCalendarUnitYearForWeekOfYear
            | NSCalendarUnitCalendar
            | NSCalendarUnitTimeZone fromDate:self];
}

@end
