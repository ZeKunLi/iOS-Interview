//
//  AppDelegate+Arithmetic.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKun Li on 2020/7/17.
//  Copyright © 2020 ZeKunLi. All rights reserved.
//

#import "AppDelegate+Arithmetic.h"
#import "ReverseList.h"
@implementation AppDelegate (Arithmetic)

- (void)reverseList {
    
    struct Node *headNode = constructList();
    printList(headNode);
    printf("--------------\n");
    struct Node *newNode = reverseList(headNode);
    printList(newNode);
    
}

@end
