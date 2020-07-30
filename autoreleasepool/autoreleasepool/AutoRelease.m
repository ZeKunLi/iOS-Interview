//
//  AutoRelease.m
//  autoreleasepool
//
//  Created by ZeKun Li on 2020/7/30.
//  Copyright © 2020 ZeKun Li. All rights reserved.
//

#import "AutoRelease.h"

@implementation AutoRelease

void test() {
    printf("AutoRelease exturn 跟 分类类似 后编译的优先执行\n");
}

- (void)dealloc {
    [super dealloc];
    printf("%s %p 最先进去的最后被释放\n",__func__,self);
}

@end
