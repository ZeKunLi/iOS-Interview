//
//  ZKLockDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/27.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKLockDemo.h"

@interface ZKLockDemo ()

@property (nonatomic, strong) NSLock *coffeeLock;
@property (nonatomic, strong) NSLock *moneyLock;

@end

@implementation ZKLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.coffeeLock = [[NSLock alloc] init];
        self.moneyLock = [[NSLock alloc] init];
        
    }
    return self;
}

- (void)__saleCoffee {
    [self.coffeeLock lock];
    [super __saleCoffee];
    [self.coffeeLock unlock];
}

- (void)__saveMoney {
    
    [self.moneyLock lock];
    [super __saveMoney];
    [self.moneyLock unlock];
}

- (void)__drawMoney {
    
    [self.moneyLock lock];
    [super __drawMoney];
    [self.moneyLock unlock];
}

@end
