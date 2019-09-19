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
        char temp = *begin;//把 begin 当中的字符取出来
        *(begin ++) = *end;//把 end 的值刚到 begin 里面之后 begin+1
        *(end --) = temp;//把 temp 的值刚到 end 里面之后 end+1
        
    }
    
}
@end
