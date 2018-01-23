//
//  UIImage+DailyKit.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DailyKit)

+ (UIImage *)dk_image;

+ (UIImage *)dk_imageWithColor:(UIColor *)color;

+ (UIImage *)dk_imageWithSize:(CGSize)size;

+ (UIImage *)dk_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)dk_imageNamed:(NSString *)name size:(CGSize)size;

+ (UIImage *)dk_imageNamed:(NSString *)name clipRect:(CGRect)clipRect;

// 从图片中心点根据图片size拉伸图片
- (UIImage *)dk_resizableFromCenter;

- (UIImage *)dk_clipWithRect:(CGRect)rect;

- (UIImage *)dk_setColor:(UIColor *)color;

+ (UIImage *)dk_imageWithURLString:(NSString *)URLString;

// action like this : - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
- (void)dk_saveImageToAlbumWithTarget:(id)target action:(SEL)action;

- (void)dk_saveImageToAlbum:(void(^)(BOOL success, NSError *error))completionHandler;

@end
