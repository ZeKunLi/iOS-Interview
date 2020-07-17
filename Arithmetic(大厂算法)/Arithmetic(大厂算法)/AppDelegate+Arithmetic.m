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
    struct Node *newNode = reverseList(headNode);
    printList(newNode);
    
}

@end
