//
//  main.m
//  autoreleasepool
//
//  Created by ZeKun Li on 2020/7/30.
//  Copyright © 2020 ZeKun Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AutoRelease.h"

extern void test(void);
extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        _objc_autoreleasePoolPrint();
        printf("================");
        AutoRelease *obj = [[[AutoRelease alloc] init] autorelease];
        _objc_autoreleasePoolPrint();
        printf("================");
        
        @autoreleasepool {
            for (int i = 0; i < 600; i++) {
                AutoRelease *obj = [[[AutoRelease alloc] init] autorelease];
                
            }
            _objc_autoreleasePoolPrint();
        }
        printf("================");
        _objc_autoreleasePoolPrint();
        test();
        
        
    }
    return 0;
}
