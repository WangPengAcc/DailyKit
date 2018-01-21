//
//  DKMacro.h
//  DailyKit
//
//  Created by 王鹏 on 2018/1/21.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#ifndef DKMacro_h
#define DKMacro_h

// NSLog
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

// Color
#define DKRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define DKRGBColor(r, g, b) DKRGBAColor(r, g, b, 1.0f)
#define DKRandomColor DKRGBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define DKHEXCOLORA(hex, a) DKRGBAColor(((float)((hex & 0xFF0000) >> 16)), ((float)((hex & 0xFF00) >> 8)), ((float)(hex & 0xFF)), a)
#define DKHEXCOLOR(hex) DKHEXCOLORA(hex, 1.0)
#define DKTableViewDefaultBackgroundColor DKRGBColor(239, 239, 244)
#define DKGrayLineColor DKRGBColor(240, 240, 240)

// 尺寸
#define DKScreenBounds [UIScreen mainScreen].bounds
#define DKScreenWidth [UIScreen mainScreen].bounds.size.width
#define DKScreenHeight [UIScreen mainScreen].bounds.size.height
#define DKStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define DKNavHeight 64


#endif /* DKMacro_h */
