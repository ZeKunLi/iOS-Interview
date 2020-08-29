//
//  TimerObject.h
//  GCD
//
//  Created by ZeKun Li on 2020/8/29.
//  Copyright © 2020 personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 当需要一个倒计时的时候就在这里加一个key
typedef enum : NSUInteger {
    TimerGlobalKeyA,
    TimerGlobalKeyB,
} TimerGlobalKey;




@interface TimerObject : NSObject

+ (void)timerTask:(void(^)(void))task
               interval:(int)interval
                  after:(int)after
                  key:(TimerGlobalKey)key;

+ (void)timerTarget:(id)target
           selector:(SEL)selector
              after:(int)after
                key:(TimerGlobalKey)key;

+ (void)timerTarget:(id)target
           selector:(SEL)selector
           interval:(int)interval
              after:(int)after
                key:(TimerGlobalKey)key;

+ (void)cancelTimerWithkey:(TimerGlobalKey)key;

@end

NS_ASSUME_NONNULL_END
