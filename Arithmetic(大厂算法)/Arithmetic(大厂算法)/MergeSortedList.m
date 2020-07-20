//
//  MergeSortedList.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKun Li on 2020/7/20.
//  Copyright © 2020 ZeKunLi. All rights reserved.
//

#import "MergeSortedList.h"

@implementation MergeSortedList

void margeList(int a[],int aLen, int b[], int bLen, int result[]) {
    
    int aIndex = 0; // 遍历数组a的指针
    int bIndex = 0; // 遍历数组b的指针
    int i = 0; // 记录当前存储位置

    while (aIndex < aLen && bIndex < bLen) {
        
        if (a[aIndex] <= b[bIndex]) {
            result[i] = a[aIndex ++];
        } else {
            result[i] = b[bIndex ++];
        }
        i ++;
        
    }
    
    while (aIndex < aLen) {
        result[i ++] = a[aIndex ++];
    }
    
    while (bIndex < bLen) {
        result[i ++] = b[bIndex ++];
    }
    
}
@end
