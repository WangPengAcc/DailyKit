//
//  NSString+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "NSString+DailyKit.h"
#import <CommonCrypto/CommonDigest.h>
#import <CoreGraphics/CoreGraphics.h>
#import "DKMacro.h"

static NSDateFormatter *fmt = nil;

@implementation NSString (DailyKit)

- (BOOL)dk_isMobileNumber
{
    return [self dk_regexCheck:@"(1)[0-9]{10}$"];
}

- (BOOL)dk_isOnlyNumber
{
    return [self dk_regexCheck:@"^[0-9]{0,}$"];
}

- (BOOL)dk_isOnlyLetter
{
    return [self dk_regexCheck:@"^[a-zA-Z]{0,}$"];
}

- (BOOL)dk_isOnlyNumberAndLetter
{
    return [self dk_regexCheck:@"^[a-zA-Z0-9]{0,}$"];
}

- (BOOL)dk_isOnlyNumberAndLetterAnd_
{
    return [self dk_regexCheck:@"^[a-zA-Z0-9_]{0,}$"];
}

- (BOOL)dk_regexCheck:(NSString *)regex
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES%@", regex] evaluateWithObject:self];
}

+ (NSString *)dk_encodeURLString:(NSString *)url
{
    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

+ (NSString *)dk_decodeURLString:(NSString *)url
{
    return url.stringByRemovingPercentEncoding;
}

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fmt = [[NSDateFormatter alloc] init];
        fmt.locale = [NSLocale currentLocale];
    });
}

- (NSDate *)dk_formatToTime
{
    return [self dk_dateFormat:DKDefaultTimeFormat];
}

- (NSDate *)dk_formatToDate
{
    return [self dk_dateFormat:DKDefaultDateFormat];
}

- (NSDate *)dk_formatToDateTime
{
    return [self dk_dateFormat:DKDefaultDateTimeFormat];
}

- (NSDate *)dk_dateFormat:(NSString *)format
{
    fmt.dateFormat = format;
    
    return [fmt dateFromString:self];
}

- (NSString *)dk_adding:(NSString *)str
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
    
    return [[num1 decimalNumberByAdding:num2] stringValue];
}

- (NSString *)dk_subtracting:(NSString *)str
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
    
    return [[num1 decimalNumberBySubtracting:num2] stringValue];
}

- (NSString *)dk_multiplying:(NSString *)str
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
    
    return [[num1 decimalNumberByMultiplyingBy:num2] stringValue];
}

- (NSString *)dk_dividing:(NSString *)str
{
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
    
    return [[num1 decimalNumberByDividingBy:num2] stringValue];
}

- (BOOL)dk_containsString:(NSString *)str
{
    if ([str respondsToSelector:@selector(containsString:)]) {
        return [self containsString:str];
    }
    else {
        return ([self rangeOfString:str].location != NSNotFound);
    }
}

- (CGFloat)dk_heightWithAttributes:(NSDictionary *)attributes maxWidth:(CGFloat)maxWidth
{
    return [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.height;
}

- (NSString *)dk_formatMobileNumber
{
    if ([self dk_isMobileNumber]) {
        NSMutableString *mobileNumber = [NSMutableString stringWithString:self];
        [mobileNumber insertString:@" " atIndex:3];
        [mobileNumber insertString:@" " atIndex:8];
        
        return mobileNumber;
    }
    
    return self;
}

- (NSString *)dk_md5
{
    const char *cStr = self.UTF8String;
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG) strlen(cStr), result);
    
    return [NSString stringWithFormat: @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}

- (NSString *)dk_md5_lowercaseString
{
    return [[self dk_md5] lowercaseString];
}

- (NSString *)dk_stringByTrimmingWhitespaceAndNewline
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)dk_numberOfLines
{
    return [self componentsSeparatedByString:@"\n"].count + 1;
}

- (CGRect)dk_boundingRectWithFont:(UIFont *)font
{
    return [self boundingRectWithSize:CGSizeMake(DKScreenWidth, CGFLOAT_MAX) options: NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil];
}

- (CGSize)dk_sizeWithFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{NSFontAttributeName: font}];
}

- (BOOL)dk_isEmpty
{
    return (!self || [self isEqualToString:@""] || [self isEqual:[NSNull null]]);
}

@end
