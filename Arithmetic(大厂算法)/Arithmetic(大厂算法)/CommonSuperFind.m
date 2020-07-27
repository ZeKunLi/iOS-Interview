//
//  CommonSuperFind.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKun Li on 2020/7/26.
//  Copyright © 2020 ZeKunLi. All rights reserved.
//

#import "CommonSuperFind.h"

@implementation CommonSuperFind



- (NSArray<UIView *> *)findCommonSuperView:(UIView *)view other:(UIView *)viewOther {
    // 获取两个视图的所有父试图
    NSArray *views = [self findSuperViews:view];
    NSArray *viewOthers = [self findSuperViews:viewOther];
    
    // 保存共同父试图
    NSMutableArray *commonSuperViews = @[].mutableCopy;
    int i = 0;
    // 倒叙循环遍历
    while (i < MIN(views.count, viewOthers.count)) {
        // 获取两个视图最上级的父试图
        UIView *view = [views objectAtIndex:views.count - i - 1];
        
        UIView *otherView = [viewOthers objectAtIndex:viewOthers.count - i - 1];
        
        // 如果两个视图是一样的加入到数组
        if (view == otherView) {
            [commonSuperViews addObject:view];
            i ++;
        }
        // 如果不一样停止遍历
        else {
            break;
        }
        
        
    }
    return commonSuperViews;
}

/// 查找所有父试图
/// @param view 当前视图
- (NSArray <UIView *> *)findSuperViews:(UIView *)view
{
    // 保存所有父试图
    NSMutableArray *views = @[].mutableCopy;
    // 获取父试图
    UIView *superView = view.superview;
    // 循环遍历，直到视图为 nil
    while (superView) {
        // 添加到视图视图
        [views addObject:superView];
        // 顺着 superview 指针向上查找
        superView = superView.superview;
    }
    return views;
}





@end



