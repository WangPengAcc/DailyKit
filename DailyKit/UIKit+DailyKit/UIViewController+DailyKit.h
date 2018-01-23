//
//  UIViewController+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2018/1/20.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DailyKit)

- (void)dk_setNavTintColor:(UIColor *)color;

- (void)dk_setNavBackgroundImage:(UIImage *)image;

- (void)dk_removeBackTitle;

// (半)透明模态弹窗
- (void)dk_presentViewController:(UIViewController *)viewController alpha:(CGFloat)alpha;

@end
