//
//  UIButton+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DailyKit)

- (void)dk_setImage:(UIImage *)image;

- (void)dk_setTitle:(NSString *)title;

- (void)dk_setTitleColor:(UIColor *)color;

- (void)dk_setFont:(UIFont *)font;

- (void)dk_addTarget:(id)target action:(SEL)action;

- (void)dk_setSpace:(CGFloat)spacing;

- (void)dk_setVerticalLayoutWithSpace:(CGFloat)spacing;

- (void)dk_changeLRLayoutWithSpace:(CGFloat)spacing;

- (void)dk_setImage:(NSString *)imageName imageSize:(CGSize)size imageTintColor:(UIColor *)color;

- (void)dk_setImage:(NSString *)imageName imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font space:(CGFloat)spacing;

- (void)dk_setImage:(NSString *)imageName imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font space:(CGFloat)spacing target:(id)target action:(SEL)action;

- (void)dk_onlyTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font cornerRadius:(CGFloat)cornerRadius target:(id)target action:(SEL)action;

- (void)dk_onlyImage:(NSString *)imageName size:(CGSize)size color:(UIColor *)color target:(id)target action:(SEL)action;

- (void)dk_onlyImage:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action;

@end
