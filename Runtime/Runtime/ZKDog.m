//
//  ZKDog.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKDog.h"
#import <objc/runtime.h>

struct method_t {
    SEL sel;
    char *types;
    IMP imp;
};
@implementation ZKDog

//- (void)test {
//    NSLog(@"%@ - test",self);
//}

//+ (BOOL)resolveClassMethod:(SEL)sel {
//    return YES;
//}



+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test)) {
        // 获取其他方法
//        Method method = class_getInstanceMethod(self, @selector(addMethod));
//        struct method_t * method = (struct method_t *)class_getInstanceMethod(self, @selector(addMethod));
        // 动态添加 test 方法
//        class_addMethod([self class], sel, method_getImplementation(method), method_getTypeEncoding(method));
//        class_addMethod([self class], sel, method->imp, method->types);
        class_addMethod([self class], sel, (IMP)c_method, "v16@0:8");
        // 返回 YES 代表有动态添加方法
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(test)) {
        Method method = class_getInstanceMethod(self, @selector(addMethod));
        
        class_addMethod(object_getClass(self), sel, method_getImplementation(method), method_getTypeEncoding(method));
    }
    return [super resolveClassMethod:sel];
}

- (void)addMethod {
    NSLog(@"%s",__func__);
}

void c_method(id self, SEL _cmd) {
    NSLog(@"%s",__func__);
    NSLog(@"c_method - %@ - %@",self,NSStringFromSelector(_cmd));
}
@end
