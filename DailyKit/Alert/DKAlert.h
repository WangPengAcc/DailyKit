//
//  DKAlert.h
//  DailyKit
//
//  Created by 王鹏 on 2018/1/10.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKAlert : NSObject

+ (void)alertWithMessage:(NSString *)message handler:(void (^)(UIAlertAction *action))handler viewController:(UIViewController *)viewController;

@end
