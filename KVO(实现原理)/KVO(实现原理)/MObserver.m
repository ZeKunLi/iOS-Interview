//
//  MObserver.m
//  KVO(实现原理)
//
//  Created by 李泽昆 on 2019/4/13.
//  Copyright © 2019 personal. All rights reserved.
//

#import "MObserver.h"
#import "MObject.h"
@implementation MObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[MObject class]]) {
        if ([keyPath isEqualToString:@"value"]) {
            // 获取 value 的新值
            NSLog(@"value的新值:%@",[change objectForKey:NSKeyValueChangeNewKey]);
        }
    }
}

@end
