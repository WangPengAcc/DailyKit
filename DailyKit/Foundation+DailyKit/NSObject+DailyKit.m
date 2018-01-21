//
//  NSObject+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "NSObject+DailyKit.h"
#import <objc/runtime.h>

@implementation NSObject (DailyKit)

// 使用KVC并且当Key不存在时避免报错
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@ 在 %@ 类中不存在！", key,  NSStringFromClass([self class]));
}

+ (void)dk_swizzledMethod:(SEL)originalSelector and:(SEL)swizzledSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
