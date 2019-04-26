//
//  UserCenter.m
//  GCD
//
//  Created by 李泽昆 on 2019/4/26.
//  Copyright © 2019 personal. All rights reserved.
//

#import "UserCenter.h"

@interface UserCenter () {
    // 定义一个并发队列
    dispatch_queue_t concurrent_queue;
    // 用户数据中心,可能多个线程需要数据访问
    NSMutableDictionary *userCenterDic;
}

@end


// 多读单写模型
@implementation UserCenter

- (id)init
{
    self = [super init];
    if (self) {
        // 通过宏定义 DISPATCH_QUEUE_CONCURRENT 创建一个并发队列
        concurrent_queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        // 创建数据容器
        userCenterDic = [NSMutableDictionary dictionary];
        
    }
    return self;
}

- (id)objectForKey:(NSString *)key {
    
    __block id object;
    dispatch_sync(concurrent_queue, ^{
        object = [self->userCenterDic objectForKey:key];
    });
    
    return object;
}


- (void)setObject:(id)obj forKey:(NSString *)key
{
    // 异步栅栏调用设置数据
    dispatch_barrier_async(concurrent_queue, ^{
        [self->userCenterDic setObject:obj forKey:key];
    });
}


@end
