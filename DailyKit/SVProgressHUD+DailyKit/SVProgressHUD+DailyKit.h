//
//  SVProgressHUD+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/28.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>

@interface SVProgressHUD (DailyKit)

+ (void)dk_onlyText:(NSString *)text;

+ (void)dk_onlyText:(NSString *)text delay:(NSTimeInterval)delay;

@end
