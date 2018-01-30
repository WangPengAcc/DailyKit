//
//  UITableView+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2018/1/30.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (DailyKit)

/**
 如果 ReuseIdentifier 的命名格式为 "类名+ID" 的方式，可用此方法注册

 @param nibName NSString
 */
- (void)dk_registerNibName:(NSString *)nibName;

- (void)dk_registerNibName:(NSString *)nibName forCellReuseIdentifier:(NSString *)identifier;

@end
