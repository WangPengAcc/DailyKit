//
//  NSDate+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#define DKSecondOfDay (24*60*60)
#define DKDefaultTimeFormat @"HH:mm"
#define DKDefaultDateFormat @"yyyy-MM-dd"
#define DKDefaultDateTimeFormat @"yyyy-MM-dd HH:mm"

#import <Foundation/Foundation.h>

@interface NSDate (DailyKit)

// 按指定格式转成NSString
- (NSString *)dk_formatToString:(NSString *)format;

// 按默认日期＋时间格式转成NSString，@see DKDefaultDateTimeFormat
- (NSString *)dk_formatToDateTimeString;

// 按默认日期格式转成NSString，@see DKDefaultDateFormat
- (NSString *)dk_formatToDateString;

// 按默认时间格式转成NSString，@see DKDefaultTimeFormat
- (NSString *)dk_formatToTimeString;

// 判断是否是今/明/昨/某天
- (BOOL)dk_isToday;
- (BOOL)dk_isTomorrow;
- (BOOL)dk_isYesterday;
- (BOOL)dk_isDate:(NSDate *)date;

// 根据两个timestamp时间算相差多少秒
+ (NSInteger)dk_secondBetween:(NSUInteger)from to:(NSUInteger)to;

// 根据NSTimeInterval获取NSDate
+ (NSDate *)dk_dateWithTimeStamp:(NSTimeInterval)timeStamp;

// 根据NSTimeInterval获取NSDateComponents
+ (NSDateComponents *)dk_dateComponentWithTimeStamp:(NSTimeInterval)timeStamp;

// 格式化日期
+ (NSString *)dk_formatToString:(NSTimeInterval)timeStamp withFormat:(NSString*)format;

// 格式化日期
+ (NSString *)dk_formatToString:(NSString *)yyyyMMdd;

@end
