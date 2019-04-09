//
//  ViewReusePool.m
//  UITableView重用机制索引条
//
//  Created by 李泽昆 on 2019/4/9.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewReusePool.h"

@interface ViewReusePool ()
// 使用中的队列
@property (nonatomic, strong) NSMutableSet *usingQueue;
// 等待使用的队列
@property (nonatomic, strong) NSMutableSet *waitQueue;

@end

@implementation ViewReusePool
- (instancetype)init
{
    self = [super init];
    if (self) {
        _waitQueue = [NSMutableSet set];
        _usingQueue = [NSMutableSet set];
    }
    return self;
}

- (void)addUsingView:(UIView *)view {
    if (view == nil) return;
    [_usingQueue addObject:view];
}

- (UIView *)dequeueReuserableView {
    UIView *view = [_waitQueue anyObject];
    if (view == nil) {
        return nil;
    } else {
        
        [_waitQueue removeObject:view];
        [_usingQueue addObject:view];
        return view;
    }
}

- (void)reset {
    UIView *view;
    while ((view = [_usingQueue anyObject])) {
        // 从使用队列中移除
        [_usingQueue removeObject:view];
        // 从等待队列中移除
        [_waitQueue addObject:view];
    }
}
@end
