//
//  NSString+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (DailyKit)

// 是否为手机号（1开头的11位数字）
- (BOOL)dk_isMobileNumber;

// 是否仅包含数字
- (BOOL)dk_isOnlyNumber;

// 是否仅包含字母
- (BOOL)dk_isOnlyLetter;

// 是否仅包含字母和数字
- (BOOL)dk_isOnlyNumberAndLetter;

// 是否仅包含字母、数字、下划线
- (BOOL)dk_isOnlyNumberAndLetterAnd_;

// 判断字符串是否符合传入的正则表达式
- (BOOL)dk_regexCheck:(NSString *)regex;

//将URL中的"特殊字符"转成“%3A%2F%2F”
+ (NSString *)dk_encodeURLString:(NSString *)url;

//将URL中的“%3A%2F%2F”转成正常字符
+ (NSString *)dk_decodeURLString:(NSString *)url;

// 按默认时间格式转成NSDate，@see DKDefaultTimeFormat
- (NSDate *)dk_formatToTime;

// 按默认日期格式转成NSDate，@see DKDefaultDateFormat
- (NSDate *)dk_formatToDate;

// 按默认日期＋时间格式转成NSDate，@see DKDefaultDateTimeFormat
- (NSDate *)dk_formatToDateTime;

// 按指定格式转成NSDate
- (NSDate *)dk_dateFormat:(NSString *)format;

// 加法运算
- (NSString *)dk_adding:(NSString *)str;

// 减法运算
- (NSString *)dk_subtracting:(NSString *)str;

// 乘法运算
- (NSString *)dk_multiplying:(NSString *)str;

// 除法运算
- (NSString *)dk_dividing:(NSString *)str;

// 判断字符串是否包含指定字符串
- (BOOL)dk_containsString:(NSString *)str;

// 根据最大宽度和文本属性获取文字所占高度
- (CGFloat)dk_heightWithAttributes:(NSDictionary *)attributes maxWidth:(CGFloat)maxWidth;

// 格式化手机号（在第3位和第7位后加入空格）
- (NSString *)dk_formatMobileNumber;

// md5
- (NSString *)dk_md5;

// md5小写
- (NSString *)dk_md5_lowercaseString;

// 返回去掉空格和新行的字符串
- (NSString *)dk_stringByTrimmingWhitespaceAndNewline;

// 根据"\n"判断有几行
- (NSUInteger)dk_numberOfLines;

// 根据字体，以及最大宽度为屏幕宽度条件下获取文本的rect
- (CGRect)dk_boundingRectWithFont:(UIFont *)font;

// 根据字体获取文本最合适的宽和高
- (CGSize)dk_sizeWithFont:(UIFont *)font;

// 判断是否是空字符串
- (BOOL)dk_isEmpty;

// 当前时间戳字符串
+ (NSString *)dk_currentTimeIntervalString;

@end
