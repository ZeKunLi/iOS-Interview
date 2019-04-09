//
//  ViewReusePool.h
//  UITableView重用机制索引条
//
//  Created by 李泽昆 on 2019/4/9.
//  Copyright © 2019 personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
// 实现重用机制的类
@interface ViewReusePool : NSObject
// 向重用池取出一个可用的 View
- (UIView *)dequeueReuserableView;
// 将不用的view放到重用池中
- (void)addUsingView:(UIView *)view;
// 重置方法,将当前使用中的视图移动到可重用队列当中
- (void)reset;
@end

NS_ASSUME_NONNULL_END
