//
//  NSDate+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "NSDate+DailyKit.h"
#import "NSString+DailyKit.h"

static NSDateFormatter *fmt = nil;
static NSCalendar *calendar = nil;

@implementation NSDate (DailyKit)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fmt = [[NSDateFormatter alloc] init];
        fmt.locale = [NSLocale currentLocale];
        
        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];//中国阳历
        [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:3600 * 8]];
    });
}

- (NSString *)dk_formatToString:(NSString *)format
{
    [fmt setDateFormat:format];
    
    return [fmt stringFromDate:self];
}

- (NSString *)dk_formatToDateTimeString
{
    return [self dk_formatToString:DKDefaultDateTimeFormat];
}

- (NSString *)dk_formatToDateString
{
    return [self dk_formatToString:DKDefaultDateFormat];
}

- (NSString *)dk_formatToTimeString
{
    return [self dk_formatToString:DKDefaultTimeFormat];
}

- (BOOL)dk_isToday
{
    return [calendar isDateInToday:self];
}

- (BOOL)dk_isTomorrow
{
    return [calendar isDateInTomorrow:self];
}

- (BOOL)dk_isYesterday
{
    return [calendar isDateInYesterday:self];
}

- (BOOL)dk_isDate:(NSDate *)date
{
    return [calendar isDate:self inSameDayAsDate:date];
}

+ (NSInteger)dk_secondBetween:(NSUInteger)from to:(NSUInteger)to
{
    NSDate *fromDate = [NSDate dateWithTimeIntervalSince1970:from/1000];
    NSDate *toDate = [NSDate dateWithTimeIntervalSince1970:to/1000];
    
    unsigned unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *components = [calendar components:unitFlags fromDate:fromDate toDate:toDate options:0];
    
    NSInteger second = (components.hour * 60 * 60) + (components.minute * 60) + components.second;
    
    return second;
}

+ (NSDate *)dk_dateWithTimeStamp:(NSTimeInterval)timeStamp
{
    return [calendar dateFromComponents:[self dk_dateComponentWithTimeStamp:timeStamp]];
}

+ (NSDateComponents *)dk_dateComponentWithTimeStamp:(NSTimeInterval)timeStamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp/1000];
    
    NSInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    
    return [calendar components:unitFlags fromDate:date];
}

+ (NSString *)dk_formatToString:(NSTimeInterval)timeStamp withFormat:(NSString*)format
{
    NSDate *date = [NSDate dk_dateWithTimeStamp:timeStamp];
    
    NSString *formatString = [date dk_formatToString:format];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:date toDate:[NSDate date] options:0];
    
    if (components.hour <= 24) {
        if (components.hour >= 1) {
            formatString = [NSString stringWithFormat:@"%ld小时前", (long)components.hour];
        }
        else {
            if (components.minute >= 1) {
                formatString = [NSString stringWithFormat:@"%ld分钟前", (long)components.minute];
            }
            else {
                formatString = @"刚刚";
            }
        }
    }
    
    return formatString;
}

+ (NSString *)dk_formatToString:(NSString *)yyyyMMdd
{
    NSDate *date = [yyyyMMdd dk_dateFormat:@"yyyyMMdd"];
    
    NSString *str = [date dk_formatToString:@"M月d日"];
    
    if ([date dk_isToday]) {
        return [NSString stringWithFormat:@"今天 (%@)", str];
    }
    else if ([date dk_isTomorrow]) {
        return [NSString stringWithFormat:@"明天 (%@)", str];
    }
    else {
        NSDate *afterTomorrow = [[NSDate date] dateByAddingTimeInterval:2*DKSecondOfDay];
        
        if ([date dk_isDate:afterTomorrow]) {
            return [NSString stringWithFormat:@"后天 (%@)", str];
        }
        else {
            return [date dk_formatToString:@"M月d日 EE "];
        }
    }
}

@end
