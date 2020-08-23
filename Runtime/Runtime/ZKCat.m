//
//  ZKCat.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/22.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKCat.h"

@implementation ZKCat
- (void)beta {
    NSLog(@"%s",__func__);
}

- (int)test:(int)age {
    return age * 9;
}

+ (void)classTest {
    NSLog(@"%s",__func__);
}

@end
