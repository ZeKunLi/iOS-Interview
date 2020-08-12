//
//  ZKStudent.h
//  Block
//
//  Created by ZeKun Li on 2020/8/10.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ZKBlock)(void);
@interface ZKStudent : NSObject
@property (nonatomic, copy) ZKBlock block;
@property (nonatomic, assign) NSInteger age;
- (void)test;
@end

NS_ASSUME_NONNULL_END
