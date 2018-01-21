//
//  UIView+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock) (void);

@interface UIView (DailyKit) <UIGestureRecognizerDelegate>

- (void)dk_setCornerRadius:(CGFloat)cornerRadius;

- (void)dk_setBorderColor:(UIColor*)color borderWidth:(CGFloat)width;

- (void)dk_clipToCircleWithBorderColor:(UIColor*)color borderWidth:(CGFloat)width;

- (void)dk_clipToCircle;

- (void)dk_addActionBlock:(ActionBlock)block;

@end
