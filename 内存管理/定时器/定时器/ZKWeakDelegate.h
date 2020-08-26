//
//  ZKWeakDelegate.h
//  定时器
//
//  Created by ZeKun Li on 2020/8/26.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKWeakDelegate : NSObject

@property (nonatomic, weak, readonly) id targer;

- (instancetype)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
