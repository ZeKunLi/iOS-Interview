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

/// 条件锁
@property (nonatomic, assign) pthread_mutex_t conditionsLock;
@property (nonatomic, assign) pthread_cond_t cond;
@property (nonatomic, strong) NSMutableArray *coffees;

@end

@implementation ZKMutexDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // 互斥锁
        pthread_mutex_init(&_coffeeLock, NULL);
        pthread_mutex_init(&_moneyLock, NULL);
        
        // 递归锁
        [self __initRecureiveLock];
        [self __recureiveMethod];
        
        // 条件锁
        pthread_mutex_init(&_conditionsLock, NULL);
        pthread_cond_init(&_cond, NULL);
        [self __conditionsMethod];
    
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

// 递归方法
- (void)__recureiveMethod {
    
    pthread_mutex_lock(&_recureiveLock);
    [super __recureiveMethod];
    pthread_mutex_lock(&_recureiveLock);
    
}

// 条件方法
- (void)__conditionsMethod {
    
    self.coffees = @[].mutableCopy;
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__drinkCoffee) object:nil] start];
    
    sleep(1);
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__makingCoffee) object:nil] start];
}

// 制作咖啡
- (void)__makingCoffee {
    pthread_mutex_lock(&_conditionsLock);
    NSLog(@"☕️制作中。。。");
    [self.coffees addObject:@"☕️"];
    NSLog(@"☕️制作完成%@",[NSThread currentThread]);
    pthread_cond_signal(&_cond);
    // 广播
//    pthread_cond_broadcast(&_cond);
    pthread_mutex_unlock(&_conditionsLock);
}

// 喝咖啡
- (void)__drinkCoffee {
    
    pthread_mutex_lock(&_conditionsLock);
    NSLog(@"想喝☕️");
    if (![self.coffees containsObject:@"☕️"]) {
        NSLog(@"没有☕️等待制作。。。");
        pthread_cond_wait(&_cond, &_conditionsLock);
    }
    [self.coffees removeObject:@"☕️"];
    NSLog(@"喝掉☕️%@",[NSThread currentThread]);
    pthread_mutex_unlock(&_conditionsLock);
    
    
}

- (void)dealloc {
    
    pthread_mutex_destroy(&_coffeeLock);
    pthread_mutex_destroy(&_moneyLock);
    pthread_mutex_destroy(&_recureiveLock);
    pthread_cond_destroy(&_cond);
}


- (void)__initRecureiveLock {
    
    
    pthread_mutexattr_t attr_t;
    
    pthread_mutexattr_init(&attr_t);
    // 设置锁类型
    pthread_mutexattr_settype(&attr_t, PTHREAD_MUTEX_RECURSIVE);
    
    pthread_mutex_init(&_recureiveLock, &attr_t);
}

@end
