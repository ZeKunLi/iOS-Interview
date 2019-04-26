//
//  MObject.m
//  KVO(实现原理)
//
//  Created by 李泽昆 on 2019/4/13.
//  Copyright © 2019 personal. All rights reserved.
//

#import "MObject.h"

@implementation MObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
    }
    return self;
}



- (void)increase {
    [self willChangeValueForKey:NSStringFromSelector(@selector(value))];
    // 直接为成员变量赋值
    _value += 1;
    [self didChangeValueForKey:NSStringFromSelector(@selector(value))];
}
@end
