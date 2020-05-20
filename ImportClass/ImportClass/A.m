//
//  A.m
//  ImportClass
//
//  Created by ZeKunLi on 2020/5/20.
//  Copyright © 2020 luckin coffee. All rights reserved.
//

#import "A.h"
#define x //定义一个宏

//C语言在对程序进行编译时，会先根据预处理命令进行“预处理”。C语言编译系统包括预处理，编译和链接等部分。
#ifndef x //先测试x是否被宏定义过
#define x
//程序段1 //如果x没有被宏定义过，定义x，并编译程序段 1
#else
//程序段2 //如果x已经定义过了则编译程序段2的语句，“忽视”程序段 1
#endif//终止if

@implementation A

@end
