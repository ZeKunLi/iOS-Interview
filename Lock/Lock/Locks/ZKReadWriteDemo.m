//
//  ZKReadWriteDemo.m
//  Lock
//
//  Created by ZeKun Li on 2020/8/29.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKReadWriteDemo.h"
#import <pthread.h>
@interface ZKReadWriteDemo () {
    pthread_rwlock_t rwlock;
    dispatch_queue_t queue;
}
@end


@implementation ZKReadWriteDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        queue = dispatch_queue_create("coffeeQueue", DISPATCH_QUEUE_CONCURRENT);
        pthread_rwlock_init(&rwlock, nil);
    }
    return self;
}



- (void)saleCoffees {
    
    for (int i = 0; i < 15; i++) {
        dispatch_async(queue, ^{
            [self getCoffeeCount];
        });
        
        dispatch_async(queue, ^{
            [self getCoffeeCount];
        });
        
        dispatch_async(queue, ^{
            [self getCoffeeCount];
        });
        
        dispatch_async(queue, ^{
            [self __makeCoffee];
        });
        
        dispatch_async(queue, ^{
            [self __saleCoffee];
        });
        
        
        dispatch_async(queue, ^{
            [self __saleCoffee];
        });
        
        
    }
}

- (void)getCoffeeCount {

    pthread_rwlock_rdlock(&rwlock);
    sleep(1);
    NSLog(@"获取库存量 %d - %@",[self cupNumber],[NSThread currentThread]);
    pthread_rwlock_unlock(&rwlock);
    
}

- (void)__saleCoffee {
    
    pthread_rwlock_wrlock(&rwlock);
    [super __saleCoffee];
    pthread_rwlock_unlock(&rwlock);
    
}

- (void)__makeCoffee {
    
    pthread_rwlock_wrlock(&rwlock);
    sleep(2);
    [super __makeCoffee];
    pthread_rwlock_unlock(&rwlock);
}





@end
