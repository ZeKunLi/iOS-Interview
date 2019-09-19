//
//  CharReverse.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKunLi on 2019/9/19.
//  Copyright © 2019 ZeKunLi. All rights reserved.
//

#import "CharReverse.h"

@implementation CharReverse
void char_reverse(char* cha) {
    char*begin = cha;
    char*end = cha + strlen(cha) - 1;
    
    while (begin < end) {
        // 交换两个字符串,同时移动指针
        char temp = *begin;
        *(begin ++) = *end;
        *(end --) = temp;
        
    }
    
}
@end
