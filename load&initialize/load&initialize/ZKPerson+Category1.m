//
//  ZKPerson+Category1.m
//  load&initialize
//
//  Created by ZeKun Li on 2020/8/13.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson+Category1.h"

@implementation ZKPerson (Category1)

+ (void)load {
    NSLog(@"%@",@"load in ZKPerson (Category1)");
}

+ (void)initialize
{
    NSLog(@"%@",@"initialize in ZKPerson (Category1)");
}

+ (void)printName {
    NSLog(@"%@",@"printName in ZKPerson (Category1)");
}

@end
