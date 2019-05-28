//
//  UIImage+RoundedCorners.m
//  UIImageView圆角离屏渲染
//
//  Created by 李泽昆 on 2019/5/28.
//  Copyright © 2019 personal. All rights reserved.
//

#import "UIImage+RoundedCorners.h"

@implementation UIImage (RoundedCorners)
- (UIImage *)circleImage {
    // NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height); CGContextAddEllipseInRect(ctx, rect);
    // 裁剪
    CGContextClip(ctx);
    // 将图片画上去
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext(); // 关闭上下文
    UIGraphicsEndImageContext();
    return image;
    
    
}
@end
