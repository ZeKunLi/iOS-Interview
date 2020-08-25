//
//  ViewController.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/25.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
@interface ViewController ()

/// 杯数
@property (nonatomic, assign) int cupNumber;
/// 金额
@property (nonatomic, assign) int money;

@property (nonatomic, assign) OSSpinLock lock;

@property (nonatomic, assign) OSSpinLock mondyLock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.lock = OS_SPINLOCK_INIT;
    
    self.money = OS_SPINLOCK_INIT;
    
    [self saleCoffees];
    
    [self goBank];
    
}

- (void)goBank {
    
    
    _money = 1000;
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self drawMoney];
        }
    });
}


/// 存钱
- (void)saveMoney {
    OSSpinLockLock(&_mondyLock);
    sleep(.2);
    _money += 100;
    OSSpinLockUnlock(&_mondyLock);
    NSLog(@"存 100 还剩💰：%d元 - %@",_money,[NSThread currentThread]);
    

}
/// 取钱
- (void)drawMoney {
    
    OSSpinLockLock(&_mondyLock);
    sleep(.2);
    _money -= 10;
    OSSpinLockUnlock(&_mondyLock);
    NSLog(@"取 10💰：%d元 - %@",_money,[NSThread currentThread]);
    
}

/// 出售一杯咖啡
- (void)saleCoffee {
    OSSpinLockLock(&_lock);
    int remainingCupNumber = _cupNumber;
    sleep(.2);
    _cupNumber = remainingCupNumber - 1;
    OSSpinLockUnlock(&_lock);
    NSLog(@"剩余 %d 杯☕️ - %@",_cupNumber,[NSThread currentThread]);
    
}

/// 出售咖啡
- (void)saleCoffees {
    
    _cupNumber = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleCoffee];
        }
    });
    
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleCoffee];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleCoffee];
        }
    });
    
    
}
@end
