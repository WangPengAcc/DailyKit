//
//  DKAlert.m
//  DailyKit
//
//  Created by 王鹏 on 2018/1/10.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import "DKAlert.h"

@implementation DKAlert

+ (void)alertWithMessage:(NSString *)message handler:(void (^)(UIAlertAction *action))handler viewController:(UIViewController *)viewController
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (handler) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cancelAction];
    }
    
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
    [alert addAction:OKAction];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end
