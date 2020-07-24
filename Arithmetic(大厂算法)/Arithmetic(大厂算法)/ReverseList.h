//
//  ReverseList.h
//  Arithmetic(大厂算法)
//
//  Created by ZeKunLi on 2019/9/19.
//  Copyright © 2019 ZeKunLi. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_ASSUME_NONNULL_BEGIN

// 定义一个链表
struct Node {
    int data;
    struct Node *next;
};



@interface ReverseList : NSObject

/// 反转链表 返回值：新的链表的头结点
/// @param head 原来链表的头结点
struct Node* reverseList(struct Node *head);

/// 递归反转链表
/// @param head 原来链表的头结点
struct Node *recursiveReveresList(struct Node *head);

/// 链表构造
struct Node * constructList(void);

/// 链表遍历输出
void printList(struct Node *head);

@end

NS_ASSUME_NONNULL_END
