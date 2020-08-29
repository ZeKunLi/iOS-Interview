//
//  TimerObject.m
//  GCD
//
//  Created by ZeKun Li on 2020/8/29.
//  Copyright © 2020 personal. All rights reserved.
//

#import "TimerObject.h"

#define ZK_TIME_SEMAPHORE_WAIT(semaphore) \
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define ZK_TIME_SEMAPHORE_SIGNAL(semaphore) \
dispatch_semaphore_signal(semaphore);

static NSMutableDictionary *_timers;
static dispatch_semaphore_t _semaphore;

@implementation TimerObject

+ (void)initialize
{
    if (self == [TimerObject class]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _timers = @{}.mutableCopy;
            _semaphore = dispatch_semaphore_create(1);
        });
    }
}

+ (void)timerTask:(void(^)(void))task interval:(int)interval after:(int)after key:(TimerGlobalKey)key {
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    ZK_TIME_SEMAPHORE_WAIT(_semaphore)
    _timers[@(key)] = timer;
    ZK_TIME_SEMAPHORE_SIGNAL(_semaphore)
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, task);
    dispatch_resume(timer);
    
}

+ (void)timerTarget:(id)target selector:(SEL)selector after:(int)after key:(TimerGlobalKey)key {
    [self timerTarget:target selector:selector interval:1 after:after key:key];
}

+ (void)timerTarget:(id)target selector:(SEL)selector interval:(int)interval after:(int)after key:(TimerGlobalKey)key {
    
    [self timerTask:^{
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if ([target respondsToSelector:selector]) {
            [target performSelector:selector];
        }
        #pragma clang diagnostic pop
    } interval:interval after:after key:key];
    
}

+ (void)cancelTimerWithkey:(TimerGlobalKey)key {
    
    
    ZK_TIME_SEMAPHORE_WAIT(_semaphore)
    dispatch_source_t timer = _timers[@(key)];

    if (timer) {
        dispatch_source_cancel(timer);
        [_timers removeObjectForKey:@(key)];
    }
    
    ZK_TIME_SEMAPHORE_SIGNAL(_semaphore)
    
    
}



@end
