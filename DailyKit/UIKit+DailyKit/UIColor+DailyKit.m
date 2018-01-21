//
//  UIColor+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "UIColor+DailyKit.h"

@implementation UIColor (DailyKit)

+ (UIColor *)dk_colorWithHexValue:(NSUInteger)hexValue
{
    return DKHEXCOLOR(hexValue);
}

+ (UIColor *)dk_colorWithHexString:(NSString *)hexString
{
    if (hexString.length == 0) {
        return nil;
    }
    
    hexString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *colorRegex = @"^#[0-9a-fA-F]{6}$";
    NSPredicate *colorTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", colorRegex];
    
    if (![colorTest evaluateWithObject:hexString]) {
        return nil;
    };
    
    NSInteger redValue = [self hexCharToInteger:[hexString characterAtIndex:1]] * 16 + [self hexCharToInteger:[hexString characterAtIndex:2]];
    NSInteger greenValue = [self hexCharToInteger:[hexString characterAtIndex:3]] * 16 + [self hexCharToInteger:[hexString characterAtIndex:4]];
    NSInteger blackValue = [self hexCharToInteger:[hexString characterAtIndex:5]] * 16 + [self hexCharToInteger:[hexString characterAtIndex:6]];
    
    return DKRGBColor(redValue, greenValue, blackValue);
}

#pragma mark - private

+ (NSInteger)hexCharToInteger:(unichar)hexChar
{
    if (hexChar >='0' && hexChar <= '9') {
        return hexChar - '0';
    }
    
    if (hexChar >='a' && hexChar <= 'f') {
        return hexChar - 'a' + 10;
    }
    
    if (hexChar >='A' && hexChar <= 'F') {
        return hexChar - 'A' + 10;
    }
    
    return 0;
}

@end
