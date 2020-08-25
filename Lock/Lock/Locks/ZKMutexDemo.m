//
//  ZKMutexDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/25.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKMutexDemo.h"
#import <pthread.h>

@interface ZKMutexDemo ()

@property (nonatomic, assign) pthread_mutex_t coffeeLock;
@property (nonatomic, assign) pthread_mutex_t moneyLock;

/// 递归锁
@property (nonatomic, assign) pthread_mutex_t recureiveLock;

@end

@implementation ZKMutexDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        pthread_mutex_init(&_coffeeLock, NULL);
        pthread_mutex_init(&_moneyLock, NULL);
        [self __initRecureiveLock];
        [self __recureiveMethod];
        
    }
    return self;
}

- (void)__saleCoffee {
    pthread_mutex_lock(&_coffeeLock);
    [super __saleCoffee];
    pthread_mutex_unlock(&_coffeeLock);
}

- (void)__saveMoney {
    
    pthread_mutex_lock(&_moneyLock);
    [super __saveMoney];
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__drawMoney {
    
    pthread_mutex_lock(&_moneyLock);
    [super __drawMoney];
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__recureiveMethod {
    
    pthread_mutex_lock(&_recureiveLock);
    [super __recureiveMethod];
    pthread_mutex_lock(&_recureiveLock);
    
}

- (void)dealloc {
    
    pthread_mutex_destroy(&_coffeeLock);
    pthread_mutex_destroy(&_moneyLock);
    pthread_mutex_destroy(&_recureiveLock);
}


- (void)__initRecureiveLock {
    
    
    pthread_mutexattr_t attr_t;
    
    pthread_mutexattr_init(&attr_t);
    // 设置锁类型
    pthread_mutexattr_settype(&attr_t, PTHREAD_MUTEX_RECURSIVE);
    
    pthread_mutex_init(&_recureiveLock, &attr_t);
}

@end
