//
//  main.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        ZKPerson *person = [[ZKPerson alloc] init];
        person.high = NO;
        person.rich = NO;
        person.handsome = NO;
        person.thin = YES;
        [person setMyEnum:(MyEnumValueA | MyEnumValueB | MyEnumValueC)];
        NSLog(@"高：%d 富：%d 帅：%d 瘦：%d",person.isHigh,person.isRich,person.isHandsome,person.isThin);
        
        
        
    }
    return 0;
}
