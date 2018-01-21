//
//  WKWebView+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2018/1/8.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (DailyKit)

- (WKNavigation *)dk_loadHTMLString:(NSString *)string;

- (WKNavigation *)dk_loadURLString:(NSString *)URLString;

@end
