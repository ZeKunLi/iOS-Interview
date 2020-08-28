//
//  ZKCondtionDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/27.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKCondtionDemo.h"

@interface ZKCondtionDemo ()
/// 条件锁
@property (nonatomic, strong) NSCondition *conditionsLock;
@property (nonatomic, strong) NSMutableArray *coffees;

@end

@implementation ZKCondtionDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.conditionsLock = [[NSCondition alloc] init];
        [self __conditionsMethod];
    }
    return self;
}

// 条件方法
- (void)__conditionsMethod {
    
    self.coffees = @[].mutableCopy;
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__makingCoffee) object:nil] start];
    sleep(1);
    [[[NSThread alloc] initWithTarget:self selector:@selector(__drinkCoffee) object:nil] start];
    
}

// 制作咖啡
- (void)__makingCoffee {
    [self.conditionsLock lock];
    NSLog(@"☕️制作中。。。");
    [self.coffees addObject:@"☕️"];
    NSLog(@"☕️制作完成%@",[NSThread currentThread]);
    [self.conditionsLock signal];
    // 广播
//    [self.conditionsLock broadcast];
    [self.conditionsLock unlock];
}

// 喝咖啡
- (void)__drinkCoffee {
    
    [self.conditionsLock lock];
    NSLog(@"想喝☕️");
    if (![self.coffees containsObject:@"☕️"]) {
        NSLog(@"没有☕️等待制作。。。");
        [self.conditionsLock wait];
    }
    [self.coffees removeObject:@"☕️"];
    NSLog(@"喝掉☕️%@",[NSThread currentThread]);
    [self.conditionsLock unlock];
    
    
}

@end
