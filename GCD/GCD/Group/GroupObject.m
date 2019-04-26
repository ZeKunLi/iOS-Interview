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


@end
