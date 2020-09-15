//
//  NSKVONotifying_ZKPerson.m
//  KVO(实现原理)
//
//  Created by ZeKun Li on 2020/9/15.
//  Copyright © 2020 personal. All rights reserved.
//

#import "NSKVONotifying_ZKPerson.h"

@implementation NSKVONotifying_ZKPerson


// Foundation伪代码
void _NSSetIntValueAndNotify {
    [self willChangeValueForKey:NSStringFromSelector(@selector(age))];
    [super setAge:age];
    [self didChangeValueForKey:NSStringFromSelector(@selector(age))];
}

- (void)setAge:(int)age {
    _NSSetIntValueAndNotify()
}

- (Class)class {
   NSKVOClass()
}

- (void)dealloc {
    NSKVODeallocate()
}

- (BOOL)_isKVOA {
    NSKVOIsAutonotifying()
}

@end
