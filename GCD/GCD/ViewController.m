//
//  ViewController.m
//  GCD
//
//  Created by 李泽昆 on 2019/4/26.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 死锁问题
    // 主队列造成的循环等待
    dispatch_async(dispatch_get_main_queue(), ^{
        [self doSomeing];
    });
    
    // 创建串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", NULL);
    
    // 创建并行队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
//    dispatch_get_global_queue(0, 0)
    
    
    dispatch_sync(serialQueue, ^{
        [self doSomeing];
    });
    
    printf("%d", 222);
}

- (void)doSomeing {
    for (int i = 0; i <= 10000; i++) {
        printf("%d", 100);
    }
}


@end
