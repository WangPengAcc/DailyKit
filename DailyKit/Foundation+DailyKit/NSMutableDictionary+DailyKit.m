//
//  NSMutableDictionary+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/30.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "NSMutableDictionary+DailyKit.h"

@implementation NSMutableDictionary (DailyKit)

- (void)dk_safeSetObject:(id)object forKey:(id<NSCopying>)key
{
    if (object && key) {
        [self setObject:object forKey:key];
    }
}

- (void)dk_safeCheckAndSetObject:(id)object forKey:(id<NSCopying>)key
{
    NSAssert(object, @"object不能为空");
    NSAssert(key, @"key不能为空");
    [self dk_safeSetObject:object forKey:key];
}

@end
