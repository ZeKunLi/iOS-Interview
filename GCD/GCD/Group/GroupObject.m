//
//  GroupObject.m
//  GCD
//
//  Created by 李泽昆 on 2019/4/26.
//  Copyright © 2019 personal. All rights reserved.
//

#import "GroupObject.h"

@interface GroupObject ()
{
    dispatch_queue_t concurrent_queue;
    NSArray *arrayURLs;
}

@end

@implementation GroupObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 创建并发队列
        concurrent_queue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT);
        // 创建图片下载地址数组
        arrayURLs = [NSArray array];
        
    }
    return self;
}


- (void)handle {
    
    // 创建一个group
    dispatch_group_t group = dispatch_group_create();
    
    for (NSURL *url in arrayURLs) {
        
        dispatch_group_async(group, concurrent_queue, ^{
            // 根据 url 去下载图片
            NSLog(@"url is %@",url);
        });
        
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       // 当添加到组中的所有任务执行完成之后会调用该 block
        NSLog(@"所有图片已下载完成");
    });
    
    
    
    
}


- (void)scene1 {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_queue_create("QUEUE_CONCURRENT", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务一  %d  %@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务二  %d  %@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务三  %d  %@",i,[NSThread currentThread]);
        }
    });
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"UI 操作");
    });
    
}


- (void)scene2 {
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_queue_create("QUEUE_CONCURRENT", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务一  %d  %@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务二  %d  %@",i,[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务三  %d  %@",i,[NSThread currentThread]);
        }
    });
    
    
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务四  %d  %@",i,[NSThread currentThread]);
        }
    });
    
    
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i<=100; i++) {
            NSLog(@"任务五  %d  %@",i,[NSThread currentThread]);
        }
    });
    
}


- (void)scene3 {
    
    dispatch_group_t group = dispatch_group_create();
    
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    dispatch_group_enter(group);
    NSURLSessionDataTask *task1 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_group_leave(group);
    }];
    [task1 response];
    
    dispatch_group_enter(group);
    NSURLSessionDataTask *task2 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_group_leave(group);
    }];
    [task2 response];
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"刷新 UI");
    });
    
}




@end
