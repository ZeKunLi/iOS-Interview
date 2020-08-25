//
//  ViewController.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/25.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/// 杯数
@property (nonatomic, assign) int cupNumber;
/// 金额
@property (nonatomic, assign) int money;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    sleep(1);
    _money += 100;
    NSLog(@"存 100 还剩💰：%d元 - %@",_money,[NSThread currentThread]);

}
/// 取钱
- (void)drawMoney {
    
    sleep(1);
    _money -= 10;
    NSLog(@"取 10💰：%d元 - %@",_money,[NSThread currentThread]);
    
}

/// 出售一杯咖啡
- (void)saleCoffee {
    
    int remainingCupNumber = _cupNumber;
    sleep(.2);
    _cupNumber = remainingCupNumber - 1;
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
