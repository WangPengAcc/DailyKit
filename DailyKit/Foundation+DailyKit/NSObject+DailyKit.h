//
//  NSObject+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DailyKit)

+ (void)dk_swizzledMethod:(SEL)originalSelector and:(SEL)swizzledSelector;

@end
