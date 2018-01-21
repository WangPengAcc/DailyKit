//
//  UILabel+DailyKit.m
//  DailyKit
//
//  Created by 王鹏 on 2017/12/9.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import "UILabel+DailyKit.h"

@implementation UILabel (DailyKit)

- (CGFloat)dk_requiredHeight
{
    static UILabel *tempLabel;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, CGFLOAT_MAX)];
        tempLabel.numberOfLines = 0;
        tempLabel.lineBreakMode = NSLineBreakByWordWrapping;
    });
    
    tempLabel.font = self.font;
    tempLabel.text = self.text;
    
    [tempLabel sizeToFit];
    
    return tempLabel.frame.size.height;
}

@end
