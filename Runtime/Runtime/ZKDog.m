//
//  ZKDog.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKDog.h"
#import "ZKCat.h"

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


#pragma mark - 动态方法解析
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


#pragma mark - 消息转发阶段-将消息转发给别人
/// 不返回空对象就不会走下面的方法了
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(beta)) {
//        return [[ZKCat alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
/// 1.
/// @param aSelector 方法名
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(beta)) {
        return nil;
    }
    return [super forwardingTargetForSelector:aSelector];
}

+ (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(classTest)) {
//        return [ZKCat class];
//        return [[ZKCat alloc] init];
        return nil;
    }
    return [super forwardingTargetForSelector:aSelector];
}

/// 2.返回方法签名（返回值类型、参数类型）
/// @param aSelector 方法名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(beta)) {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
        return [[[ZKCat alloc] init] methodSignatureForSelector:aSelector];
//        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    
    if (aSelector == @selector(test:)) {
        return [NSMethodSignature signatureWithObjCTypes:"i@:i"];
    }
    return [super methodSignatureForSelector:aSelector];
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(classTest)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

/// 3. 转发调用
/// @param anInvocation 封装的一个函数调用（方法调用者、方法、方法参数）
/// anInvocation.target 方法调用者
/// anInvocation.selector 方法名
/// [anInvocation getArgument:nil atIndex:0]; 方法参数
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
//    NSLog(@"%@",anInvocation.target);
//    NSLog(@"%@",NSStringFromSelector(anInvocation.selector));
//    [anInvocation retainArguments];
    
//    anInvocation.target = [[ZKCat alloc] init];
//    [anInvocation invoke];
    
    // 消息转发给 Cat;
//    [anInvocation invokeWithTarget:[[ZKCat alloc] init]];
    
    
    if (anInvocation.selector == @selector(beta)) {
        anInvocation.selector = @selector(addMethod);
        [anInvocation invoke];
        NSLog(@"%s",__func__);
    }
    
    
    if (anInvocation.selector == @selector(test:)) {
        int age;
        [anInvocation getArgument:&age atIndex:2];
        age += 12;
        NSLog(@"age = %d",age);
        
        [anInvocation invokeWithTarget:[[ZKCat alloc] init]];
        int catAge;
        [anInvocation getReturnValue:&catAge];
        
        NSLog(@"%d",catAge);
        
    }
    
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"class");
}

@end
