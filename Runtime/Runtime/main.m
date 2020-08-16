//
//  main.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKPerson.h"
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        ZKPerson *person = [[ZKPerson alloc] init];
        
        objc_setAssociatedObject(person, @"name", @"Zack", OBJC_ASSOCIATION_COPY_NONATOMIC);
        person.high = NO;
        
        __weak weakPerson = person;
        person.rich = NO;
        person.handsome = NO;
        person.thin = YES;
        [person setMyEnum:(MyEnumValueA | MyEnumValueB | MyEnumValueC)];
        NSLog(@"高：%d 富：%d 帅：%d 瘦：%d",person.isHigh,person.isRich,person.isHandsome,person.isThin);
        
        
        
    }
    return 0;
}
