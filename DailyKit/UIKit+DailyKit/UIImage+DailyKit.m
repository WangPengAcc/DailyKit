//
//  UIImage+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "UIImage+DailyKit.h"
#import "DKMacro.h"
#import <Photos/Photos.h>

@implementation UIImage (DailyKit)

+ (UIImage *)dk_image
{
    return [UIImage dk_imageWithColor:DKRandomColor size:CGSizeMake(1, 1)];
}

+ (UIImage *)dk_imageWithColor:(UIColor *)color
{
    return [UIImage dk_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)dk_imageWithSize:(CGSize)size
{
    return [UIImage dk_imageWithColor:DKRandomColor size:size];
}

+ (UIImage *)dk_imageWithColor:(UIColor *)color
                                  size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    
    [color setFill];
    
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)dk_imageNamed:(NSString *)name
                   size:(CGSize)size
{
    UIImage *img = [UIImage imageNamed:name];
    
    UIGraphicsBeginImageContext(size);
    
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImg;
}

+ (UIImage *)dk_imageNamed:(NSString *)name
                      clipRect:(CGRect)clipRect
{
    UIImage *img = [UIImage imageNamed:name];
    
    return [img dk_clipWithRect:clipRect];
}

- (UIImage *)dk_resizableFromCenter
{
    CGPoint center = CGPointMake(self.size.width / 2.0f, self.size.height / 2.0f);
    
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(center.y, center.x, center.y, center.x) resizingMode:UIImageResizingModeStretch];
}

- (UIImage *)dk_clipWithRect:(CGRect)rect
{
    CGImageRef cgRef = self.CGImage;
    
    CGImageRef imgRef = CGImageCreateWithImageInRect(cgRef, rect);
    
    UIImage *img = [UIImage imageWithCGImage:imgRef];
    
    CGImageRelease(imgRef);
    
    return img;
}

- (UIImage *)dk_setColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)dk_imageWithURLString:(NSString *)URLString
{
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:URLString]]];
}

- (void)dk_saveImageToAlbumWithTarget:(id)target action:(SEL)action
{
    UIImageWriteToSavedPhotosAlbum(self, target, action, (__bridge void *)target);
}

- (void)dk_saveImageToAlbum:(void(^)(BOOL success, NSError *error))completionHandler
{
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        
        [PHAssetChangeRequest creationRequestForAssetFromImage:self];
        
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        
        completionHandler(success, error);
    }];
}

@end
