//
//  CustomButton.m
//  UI事件传递Button指定位置响应
//
//  Created by 李泽昆 on 2019/4/10.
//  Copyright © 2019 personal. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // *返回 Nil这个试图就不响应 响应就调用pointInside方法
    // ①
    // 是否是隐藏
    // 是否alpha是否隐藏
    // 是否开启交互
    if (self.alpha <=0.1 ||
        self.isHidden ||
        !self.userInteractionEnabled) {
        return nil;
    }
    // ②
    // 然后调用 pointInside 方法 如果 YES 遍历子试图 NO 则返回 Nil
    if ([self pointInside:point withEvent:event]) {
        // ③
        // 遍历他的子试图
        __block UIView *hit = nil;
        [self.subviews enumerateObjectsWithOptions:(NSEnumerationReverse) usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            // 坐标转换（获取父试图的点转换到当前子视图的点）
            CGPoint vonvertPoint = [self convertPoint:point toView:obj];
            // ④
            // 调用子试图的hittest方法
            hit = [obj hitTest:vonvertPoint withEvent:event];
            // ⑤
            // 如果找到了接受事件的对象,则停止遍历
            if (hit) {
                *stop = YES;
            }

        }];

        // ⑥
        // 找了返回子试图 没有返回父试图
        if (hit) {
            return hit;
        } else {
            return self;
        }
    } else {
        return nil;
    }
    
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    CGFloat x2 = self.frame.size.width / 2;
    CGFloat y2 = self.frame.size.height / 2;
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    // 在以当前控件中心为圆心 半径为控件宽度的 / 2
    if (dis <= self.frame.size.width / 2) {
        return YES;
    } else {
        return NO;
    }
    return NO;
}

@end
