//
//  NSArray+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/30.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "NSArray+DailyKit.h"

@implementation NSArray (DailyKit)

- (id)dk_safeObjectAtIndex:(NSUInteger)index
{
    NSAssert(index < self.count, @"数组越界");
    return index < self.count ? [self objectAtIndex:index] : nil;
}

- (NSString *)dk_JSONString
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    
    if (jsonData) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    } else {
        return @"[]";
    }
}

@end
