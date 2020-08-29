//
//  SemaphoreObject.h
//  GCD
//
//  Created by ZeKun Li on 2020/8/28.
//  Copyright © 2020 personal. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ZK_SEMAPHORE_DOWNLOAD_BEGIN \
static dispatch_semaphore_t semaphore;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
    semaphore = dispatch_semaphore_create(5);\
});\
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define ZK_SEMAPHORE_DOWNLOAD_END \
dispatch_semaphore_signal(semaphore);

NS_ASSUME_NONNULL_BEGIN

@interface SemaphoreObject : NSObject
- (void)downloadTVPlay;
@end

NS_ASSUME_NONNULL_END
