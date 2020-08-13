//
//  ZKPerson+Category2.m
//  load&initialize
//
//  Created by ZeKun Li on 2020/8/13.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson+Category2.h"

@implementation ZKPerson (Category2)

+ (void)load {
    NSLog(@"%@",@"load in ZKPerson (Category2)");
}

+ (void)printName {
    NSLog(@"%@",@"printName in ZKPerson (Category2)");
}

@end
