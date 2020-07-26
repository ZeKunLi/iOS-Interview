//
//  HashFind.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKun Li on 2020/7/26.
//  Copyright © 2020 ZeKunLi. All rights reserved.
//

#import "HashFind.h"

@implementation HashFind

char findFirstChar(char *cha) {
    
    
    if (strcmp(cha, "") == 0) {
        return ' ';
    }
    
    char result = '\0';
    
    // 1.初始化数组
    int array[265];
    
    for (int i = 0; i<256; i++) {
        array[i] = 0;
    }
    
    // 2.存储每个字母出现的个数
    
    // 定义一个指针 指向当前字符串头部
    char *p = cha;
    while (*p!='\0') {
        // 在字母对应存储位置 进行出现次数 +1 操作
        array[*p++]++;
    }
    
    // 将P指针重新指向字符串头部
    p = cha;
    // 3.获取第一个出现次数为 1 的个数
    while (p!='\0') {
        
        if (array[*p] == 1) {
            result = *p;
            break;
        }
        p++;
    }
    
    
    return result;
    
    
}
@end
