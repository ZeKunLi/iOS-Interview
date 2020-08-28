//
//  ZKCondtionLockDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/28.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKCondtionLockDemo.h"

@interface ZKCondtionLockDemo ()
/// 条件锁
@property (nonatomic, strong) NSConditionLock *conditionsLock;

@end

@implementation ZKCondtionLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.conditionsLock = [[NSConditionLock alloc] initWithCondition:1];
        [self __conditionsMethod];
    }
    return self;
}

// 条件方法
- (void)__conditionsMethod {
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
    sleep(1);
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    sleep(1);
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    
}


- (void)__one {
    // lock 是不关系当前条件的
//    [self.conditionsLock lock];
    [self.conditionsLock lockWhenCondition:1];
    
    sleep(1);
    NSLog(@"%s - %@",__func__,[NSThread currentThread]);
    
    [self.conditionsLock unlockWithCondition:2];
    
}


- (void)__two {
    
    [self.conditionsLock lockWhenCondition:2];
    
    sleep(1);
    NSLog(@"%s - %@",__func__,[NSThread currentThread]);
    
    [self.conditionsLock unlockWithCondition:3];
    
}

- (void)__three {
    
    [self.conditionsLock lockWhenCondition:3];
    
    sleep(1);
    NSLog(@"%s - %@",__func__,[NSThread currentThread]);
    
    [self.conditionsLock unlockWithCondition:4];
    
}

@end

