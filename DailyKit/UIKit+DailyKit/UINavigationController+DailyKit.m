//
//  UINavigationController+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2018/1/20.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import "UINavigationController+DailyKit.h"

@implementation UINavigationController (DailyKit)

- (void)dk_setFontColor:(UIColor *)color
{
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
}

- (void)dk_setGraduateColorWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor
{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    [self dk_drawLinearGradient:gc path:path startColor:startColor.CGColor endColor:endColor.CGColor];
    CGPathRelease(path);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}

- (void)dk_drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(self.navigationBar.bounds.size.width + 10, self.navigationBar.bounds.size.height + 10);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
