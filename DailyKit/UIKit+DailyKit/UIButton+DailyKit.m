//
//  UIButton+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "UIButton+DailyKit.h"
#import "UIImage+DailyKit.h"

@implementation UIButton (DailyKit)

- (void)dk_setImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)dk_setTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)dk_setTitleColor:(UIColor *)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (void)dk_setFont:(UIFont *)font
{
    self.titleLabel.font = font;
}

- (void)dk_addTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)dk_setSpace:(CGFloat)spacing
{
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -(spacing * 0.5), 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(spacing * 0.5));
}

- (void)dk_setVerticalLayoutWithSpace:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, -titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + spacing), 0.0);
}

- (void)dk_changeLRLayoutWithSpace:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.image.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width, 0, -titleSize.width - spacing);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width - spacing, 0, imageSize.width);
}

- (void)dk_setImage:(NSString *)imageName imageSize:(CGSize)size imageTintColor:(UIColor *)color
{
    UIImage *img = [UIImage dk_imageNamed:imageName size:size];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self setImage:img forState:UIControlStateNormal];
    [self.imageView setTintColor:color];
}

- (void)dk_setImage:(NSString *)imageName imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font space:(CGFloat)spacing
{
    [self setImage:[UIImage dk_imageNamed:imageName size:size] forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.titleLabel.font = font;
    [self dk_setSpace:spacing];
}

- (void)dk_setImage:(NSString *)imageName imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font space:(CGFloat)spacing target:(id)target action:(SEL)action
{
    [self setImage:[UIImage dk_imageNamed:imageName size:size] forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.titleLabel.font = font;
    [self dk_setSpace:spacing];
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)dk_onlyTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font cornerRadius:(CGFloat)cornerRadius target:(id)target action:(SEL)action
{
    [self dk_setTitle:title];
    [self dk_setTitleColor:titleColor];
    self.backgroundColor = backgroundColor;
    [self dk_setFont:font];
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)dk_onlyImage:(NSString *)imageName size:(CGSize)size color:(UIColor *)color target:(id)target action:(SEL)action
{
    UIImage *img = [UIImage dk_imageNamed:imageName size:size];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self setImage:img forState:UIControlStateNormal];
    [self.imageView setTintColor:color];
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)dk_onlyImage:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action
{
    [self setImage:[UIImage dk_imageNamed:imageName size:size] forState:UIControlStateNormal];
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
