//
//  MergeSortedList.h
//  Arithmetic(大厂算法)
//
//  Created by ZeKun Li on 2020/7/20.
//  Copyright © 2020 ZeKunLi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MergeSortedList : NSObject

/// 将两个有序数组合并成一个数组，且仍然保持有序
/// @param a 数组
/// @param aLen a 数组长度
/// @param b 数组
/// @param bLen 数组长度
/// @param result 合并结果
void margeList(int a[],int aLen, int b[], int bLen, int result[]);

@end


