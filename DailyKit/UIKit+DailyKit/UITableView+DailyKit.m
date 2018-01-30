//
//  UITableView+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2018/1/30.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import "UITableView+DailyKit.h"

@implementation UITableView (DailyKit)

- (void)dk_registerNibName:(NSString *)nibName
{
    [self dk_registerNibName:nibName forCellReuseIdentifier:[NSString stringWithFormat:@"%@ID", nibName]];
}

- (void)dk_registerNibName:(NSString *)nibName forCellReuseIdentifier:(NSString *)identifier
{
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:identifier];
}

@end
