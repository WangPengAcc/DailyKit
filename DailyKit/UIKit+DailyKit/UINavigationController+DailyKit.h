//
//  UINavigationController+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2018/1/20.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (DailyKit)

/**
 字体颜色

 @param color UIColor
 */
- (void)dk_setFontColor:(UIColor *)color;

/**
 渐变色背景图片

 @param startColor UIColor
 @param endColor UIColor
 */
- (void)dk_setGraduateColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

@end
