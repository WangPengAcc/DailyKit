//
//  NSArray+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/30.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DailyKit)

- (id)dk_safeObjectAtIndex:(NSUInteger)index;

- (NSString *)dk_JSONString;

@end
