//
//  UIViewController+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2018/1/20.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import "UIViewController+DailyKit.h"

@implementation UIViewController (DailyKit)

- (void)dk_setNavTintColor:(UIColor *)color
{
    self.navigationController.navigationBar.tintColor = color;
}

- (void)dk_setNavBackgroundImage:(UIImage *)image
{
    if (self.navigationController) {
        
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)dk_removeBackTitle
{
    if (self.navigationController) {
        
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:nil];
    }
}

@end
