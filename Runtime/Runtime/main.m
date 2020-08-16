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
        person.high = YES;
        person.rich = NO;
        person.handsome = NO;
        
        NSLog(@"高：%d 富：%d 帅： %d",person.isHigh,person.isRich,person.isHandsome);
        
    }
    return 0;
}
