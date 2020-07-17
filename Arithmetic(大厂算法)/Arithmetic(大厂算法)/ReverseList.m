//
//  ReverseList.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKunLi on 2019/9/19.
//  Copyright © 2019 ZeKunLi. All rights reserved.
//

#import "ReverseList.h"

@implementation ReverseList

/// 反转链表
/// @param head 原来链表的头结点
struct Node* reverseList(struct Node *head) {
    
    // 定义一个头结点指向
    struct Node *newHead = NULL;
    
    struct Node *cur = head;
    
    // 遍历链表
    while (cur != NULL) {
        
        // 1.创建临时变量记录下一个节点(记录指针移向第二个位置) 占位
        struct Node *temp = cur->next;
        // 2.当前结点的 next指向新链表的头部
        cur->next = newHead;
        // 3.更改新链表头部为当前结点
        newHead = cur;
        // 4.移动p指针
        cur = temp;
        
    }
    
    return newHead;
}

struct Node * constructList(void) {
    
    // 1.定义一个头结点指向
    struct Node *head = NULL;
    
    // 2.记录当前尾结点
    struct Node *cur = NULL;
    
    // 3.创建每一个结点，实现链表结点相挂
    for (int i = 1; i < 5; i++) {
        // 1.创建结点分配的空间
        struct Node*node = malloc(sizeof(struct Node));
        // 2.对应的数据域位当前 i
        node->data = i;
        // 3. 头结点为空,新结点即为头结点
        if (head == NULL) {
            head = node;
        }
        // 4. 当前结点的 next 为新结点
        else {
            cur->next = node;
        }
        cur = node;
    }
    
    return head;
    
}

void printList(struct Node *head) {
    struct Node *temp = head;
    while (temp != NULL) {
        printf("node is %d\n",temp->data);
        temp = temp->next;
    }
}

@end
