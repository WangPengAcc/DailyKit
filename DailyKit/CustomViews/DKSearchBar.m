//
//  DKSearchBar.m
//  DailyKit
//
//  Created by 王鹏 on 2018/1/19.
//  Copyright © 2018年 WANGPENG. All rights reserved.
//

#import "DKSearchBar.h"

@implementation DKSearchBar

bool flag = NO;

- (void)setContentInset:(UIEdgeInsets)contentInset
{
    _contentInset = contentInset;
    
    flag = YES;
    
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *view in self.subviews) {
        
        for (UIView *subView in view.subviews) {
            
            if ([subView isKindOfClass:[UITextField class]]) {
                
                if (flag) {
                    
                    subView.frame = CGRectMake(_contentInset.left, _contentInset.top, self.bounds.size.width - _contentInset.left - _contentInset.right, self.bounds.size.height - _contentInset.top - _contentInset.bottom);
                    
                } else {
                    
                    CGFloat top = 0;
                    CGFloat bottom = 0;
                    CGFloat left = 0;
                    CGFloat right = 0;
                    
                    self.contentInset = UIEdgeInsetsMake(top, left, bottom, right);
                }
            }
            
            if ([subView isKindOfClass:[UIButton class]] && flag) {
                
                CGRect frame = subView.frame;
                
                frame.origin.x = self.bounds.size.width - _contentInset.right - frame.size.width - 10;
                
                subView.frame = frame;
            }
        }
    }
}

@end
