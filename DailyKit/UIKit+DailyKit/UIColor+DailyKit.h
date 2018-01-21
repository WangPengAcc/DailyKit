//
//  UIColor+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DailyKit)

// 将美工提供的颜色值转换成RGB颜色
+ (UIColor *)dk_colorWithHexValue:(NSUInteger)hexValue;

+ (UIColor *)dk_colorWithHexString:(NSString *)hexString;

@end
