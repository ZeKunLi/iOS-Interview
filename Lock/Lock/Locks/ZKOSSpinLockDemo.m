//
//  ZKOSSpinLockDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/25.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKOSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface ZKOSSpinLockDemo ()

@property (nonatomic, assign) OSSpinLock coffeeLock;
@property (nonatomic, assign) OSSpinLock moneyLock;

@end

@implementation ZKOSSpinLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.coffeeLock = OS_SPINLOCK_INIT;
        self.moneyLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__saleCoffee {
    
    OSSpinLockLock(&_coffeeLock);
    [super __saleCoffee];
    OSSpinLockUnlock(&_coffeeLock);
}

- (void)__saveMoney {
    
    OSSpinLockLock(&_moneyLock);
    [super __saveMoney];
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__drawMoney {
    
    OSSpinLockLock(&_moneyLock);
    [super __drawMoney];
    OSSpinLockUnlock(&_moneyLock);
}

@end
