//
//  AppDelegate+Arithmetic.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKun Li on 2020/7/17.
//  Copyright © 2020 ZeKunLi. All rights reserved.
//

#import "AppDelegate+Arithmetic.h"
#import "CharReverse.h"
#import "ReverseList.h"
#import "MergeSortedList.h"
#import "HashFind.h"

@implementation AppDelegate (Arithmetic)

-(void)charReverse {
    char chars[] = "hello,word!";
    char_reverse(chars);
    
    printf("%s\n",chars);
}

- (void)reverseList {
    
    struct Node *headNode = constructList();
    printList(headNode);
    printf("--------------\n");
    struct Node *newNode = recursiveReveresList(headNode);
    printList(newNode);
    
}

- (void)mergeSortedList {
    
    // 有序数组归并
    int a[5] = {0, 2, 3, 4, 6};
    
    int b[8] = {1, 5, 7, 9, 10 ,11 ,12, 13};
    
    // 用于存储归并数组
    int result[13];
    
    margeList(a, 5, b, 8, result);
    
    
    
    
    for (int i = 0; i < 13; i ++) {
        printf("%d\n",result[i]);
    }
    
    
}

- (void)hasdFind {
    // 查找第一个只出现一次的字符
    char cha[] = "leetcode";
    char fc = findFirstChar(cha);
    printf("this char is %c \n", fc);
}


@end
