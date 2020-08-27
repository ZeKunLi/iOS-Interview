//
//  ZKWeakDelegate.m
//  定时器
//
//  Created by ZeKun Li on 2020/8/26.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKWeakDelegate.h"

@implementation ZKWeakDelegate

- (instancetype)initWithTarget:(id)target
{
    self = [super init];
    if (self) {
        _target = target;
    }
    return self;
}


//- (void)timerTest {
//    NSLog(@"%s",__func__);
//    [self.targer timerTest];
//}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _target;
}


@end
