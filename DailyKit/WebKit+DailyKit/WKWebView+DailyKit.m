//
//  WKWebView+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2018/1/8.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import "WKWebView+DailyKit.h"

@implementation WKWebView (DailyKit)

- (WKNavigation *)dk_loadHTMLString:(NSString *)string
{
    self.scrollView.scrollEnabled = NO;
    
    return [self loadHTMLString:string baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}

- (WKNavigation *)dk_loadURLString:(NSString *)URLString
{
    NSURL *url = [NSURL URLWithString:[URLString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    return [self loadRequest:request];
}

@end
