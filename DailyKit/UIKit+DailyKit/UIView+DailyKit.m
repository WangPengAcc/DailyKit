//
//  UIView+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "UIView+DailyKit.h"
#import <objc/runtime.h>

@implementation UIView (DailyKit)

- (void)dk_setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)dk_setBorderColor:(UIColor*)color
           borderWidth:(CGFloat)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

- (void)dk_clipToCircleWithBorderColor:(UIColor*)color
                        borderWidth:(CGFloat)width
{
    [self dk_setCornerRadius:self.frame.size.width / 2];
    [self dk_setBorderColor:color borderWidth:width];
}

- (void)dk_clipToCircle
{
    [self dk_clipToCircleWithBorderColor:[UIColor clearColor] borderWidth:CGFLOAT_MIN];
}

#pragma  mark - 添加响应事件start
static char kActionBlockKey;

- (void)dk_setBlock:(ActionBlock)block forKey:(void *)blockKey
{
    self.userInteractionEnabled = YES;
    objc_setAssociatedObject(self, blockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)dk_runBlockForKey:(void *)blockKey
{
    ActionBlock block = objc_getAssociatedObject(self, blockKey);
    if (block) block();
}

- (void)dk_addActionBlock:(ActionBlock)block
{
    UITapGestureRecognizer* gesture = [self dk_addTapGestureRecognizerWithTaps:1 touches:1 selector:@selector(dk_viewWasTapped)];
    [self addGestureRecognizer:gesture];
    [self dk_setBlock:block forKey:&kActionBlockKey];
}

- (void)dk_viewWasTapped
{
    [self dk_runBlockForKey:&kActionBlockKey];
}

- (UITapGestureRecognizer*)dk_addTapGestureRecognizerWithTaps:(NSUInteger)taps touches:(NSUInteger)touches selector:(SEL)selector
{
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:selector];
    tapGesture.delegate = self;
    tapGesture.numberOfTapsRequired = taps;
    tapGesture.numberOfTouchesRequired = touches;
    return tapGesture;
}
#pragma 添加响应事件end

@end
