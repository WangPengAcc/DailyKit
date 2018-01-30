//
//  UIImageView+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2018/1/30.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import "UIImageView+DailyKit.h"

@implementation UIImageView (DailyKit)

- (void)dk_setTintColor:(UIColor *)tintColor
{
    self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.tintColor = tintColor;
}

@end
