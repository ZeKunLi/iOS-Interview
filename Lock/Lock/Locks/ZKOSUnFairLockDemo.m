//
//  ZKOSUnFairLockDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/25.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKOSUnFairLockDemo.h"
#import <os/lock.h>

@interface ZKOSUnFairLockDemo ()

@property (nonatomic, assign) os_unfair_lock coffeeLock;
@property (nonatomic, assign) os_unfair_lock moneyLock;

@end

@implementation ZKOSUnFairLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.coffeeLock = OS_UNFAIR_LOCK_INIT;
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__saleCoffee {
    os_unfair_lock_lock(&_coffeeLock);
    [super __saleCoffee];
    os_unfair_lock_unlock(&_coffeeLock);
}

- (void)__saveMoney {
    
    os_unfair_lock_lock(&_moneyLock);
    [super __saveMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__drawMoney {
    
    os_unfair_lock_lock(&_moneyLock);
    [super __drawMoney];
    os_unfair_lock_unlock(&_moneyLock);
}

@end

