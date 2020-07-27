//
//  CommonSuperFind.h
//  Arithmetic(大厂算法)
//
//  Created by ZeKun Li on 2020/7/26.
//  Copyright © 2020 ZeKunLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CommonSuperFind : NSObject
// 查找两个视图的共同父视图
- (NSArray<UIView *> *)findCommonSuperView:(UIView *)view other:(UIView *)viewOther;
@end

NS_ASSUME_NONNULL_END
