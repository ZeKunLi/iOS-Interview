//
//  SemaphoreObject.m
//  GCD
//
//  Created by ZeKun Li on 2020/8/28.
//  Copyright © 2020 personal. All rights reserved.
//

#import "SemaphoreObject.h"

@interface SemaphoreObject ()
@end

@implementation SemaphoreObject

- (void)downloadTVPlay {
    
    ZK_SEMAPHORE_DOWNLOAD_BEGIN
    sleep(2);
    static int count;
    count++;
    NSLog(@"%@ 第%d集",[NSThread currentThread],count);
    ZK_SEMAPHORE_DOWNLOAD_END
    
}

@end
