//
//  ZKStudent.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/23.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKStudent.h"
#import <objc/runtime.h>

struct objc_super {
    /// 消息接受者
    __unsafe_unretained _Nonnull id receiver;
    /// 消息接收者的父类
    __unsafe_unretained _Nonnull Class super_class;

};

@implementation ZKStudent
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"[self class] = %@",[self class]);
        NSLog(@"[self superclass] = %@",[self superclass]);
        NSLog(@"======================");
        NSLog(@"[super class] = %@",[super class]);
        NSLog(@"[super superclass] = %@",[super superclass]);
        
        
    }
    return self;
}

- (void)run {
    // 消息接收者仍然是 ZKStudent 对象
    [super run];
    NSLog(@"%s",__func__);
    
//    struct objc_super arg = {
//        self,
//        [ZKPerson class])
//    };
    
//    objc_msgSendSuper(arg,sel_registerName("run"));
    
//    objc_msgSendSuper(arg, @selector(run));
}
@end

//@implementation NSObject
//
//- (Class)class {
//   return object_getClass(self);
//}
//
//- (Class)superClass {
//    return class_getSuperclass(self);
//}
//
//@end
