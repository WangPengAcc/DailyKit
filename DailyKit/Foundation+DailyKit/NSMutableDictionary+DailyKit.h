//
//  NSMutableDictionary+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/30.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (DailyKit)

- (void)dk_safeSetObject:(id)object forKey:(id<NSCopying>)key;

- (void)dk_safeCheckAndSetObject:(id)object forKey:(id<NSCopying>)key;

@end
