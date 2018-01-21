//
//  SVProgressHUD+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/28.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "SVProgressHUD+DailyKit.h"

@implementation SVProgressHUD (DailyKit)

+ (void)dk_onlyText:(NSString *)text
{
    [self dk_onlyText:text delay:1.0f];
}

+ (void)dk_onlyText:(NSString *)text delay:(NSTimeInterval)delay
{
    [SVProgressHUD setInfoImage:[UIImage dk_imageWithSize:CGSizeZero]];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 180)];
    [SVProgressHUD showInfoWithStatus:text];
    [SVProgressHUD dismissWithDelay:delay];
}

@end
