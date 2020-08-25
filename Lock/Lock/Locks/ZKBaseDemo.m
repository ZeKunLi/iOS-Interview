//
//  ZKBaseDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/25.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKBaseDemo.h"

@interface ZKBaseDemo ()

/// 杯数
@property (nonatomic, assign) int cupNumber;
/// 金额
@property (nonatomic, assign) int money;

@end

@implementation ZKBaseDemo



/// 去银行
- (void)goBank {
    
    _money = 1000;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __drawMoney];
        }
    });
}

/// 出售咖啡
- (void)saleCoffees {
    
    _cupNumber = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleCoffee];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleCoffee];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleCoffee];
        }
    });
    
}

#pragma mark Private Methond

/// 出售一杯咖啡
- (void)__saleCoffee {
    
    int remainingCupNumber = _cupNumber;
    sleep(.2);
    _cupNumber = remainingCupNumber - 1;
    NSLog(@"剩余 %d 杯☕️ - %@",_cupNumber,[NSThread currentThread]);

}

/// 存钱
- (void)__saveMoney {
    
    sleep(.4);
    _money += 100;
    NSLog(@"存 100 元，还剩💰：%d元 - %@",_money,[NSThread currentThread]);

}

/// 取钱
- (void)__drawMoney {
    
    sleep(.1);
    _money -= 10;
    NSLog(@"取 10 元，还剩💰：%d元 - %@",_money,[NSThread currentThread]);
    
}


/// 递归调用
- (void)__recureiveMethod {
    static int count = 0;
    
    if (count < 5) {
        count ++;
        NSLog(@"递归调用%d次",count);
        [self __recureiveMethod];
    }
}

@end
