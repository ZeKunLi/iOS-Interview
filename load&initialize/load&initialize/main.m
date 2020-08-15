//
//  main.m
//  load&initialize
//
//  Created by ZeKun Li on 2020/8/13.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>

#import "ZKPerson.h"
#import "ZKStudent.h"
#import "ZKTeacher.h"

/*
 MARK:- initialize 关键代码（msgsend调用）
 类方法
 Method class_getClassMethod(Class cls, SEL sel)
 {
     if (!cls  ||  !sel) return nil;
            //调用实例方法
     return class_getInstanceMethod(cls->getMeta(), sel);
 }
实列方法
 1.获取方法
 Method class_getInstanceMethod(Class cls, SEL sel)
 {
     if (!cls  ||  !sel) return nil;
     // Search method lists, try method resolver, etc.
     lookUpImpOrForward(nil, sel, cls, LOOKUP_RESOLVER);
     return _class_getMethod(cls, sel);
 }
 2.查找方法实现
 IMP lookUpImpOrForward(id inst, SEL sel, Class cls, int behavior) {
    // 有没有调用 initialized
    if (slowpath((behavior & LOOKUP_INITIALIZE) && !cls->isInitialized())) {
        cls = initializeAndLeaveLocked(cls, inst, runtimeLock);
    }
 }
 static Class initializeAndLeaveLocked(Class cls, id obj, mutex_t& lock)
 {
     return initializeAndMaybeRelock(cls, obj, lock, true);
 }
3.调用过 initialize
 static Class initializeAndMaybeRelock(Class cls, id inst,
                                       mutex_t& lock, bool leaveLocked)
 {
     lock.assertLocked();
     ASSERT(cls->isRealized());
     // 调用过 initialize
     if (cls->isInitialized()) {
         if (!leaveLocked) lock.unlock();
         return cls;
     }

     // runtimeLock is now unlocked, for +initialize dispatch
     ASSERT(nonmeta->isRealized());
     // 没有调用过 initialize
     initializeNonMetaClass(nonmeta);

     if (leaveLocked) runtimeLock.lock();
     return cls;
 }
4.初始化元类
 void initializeNonMetaClass(Class cls)
 {
     Class supercls;
     bool   = NO;

     // Make sure super is done initializing BEFORE beginning to initialize cls.
     // See note about deadlock above.
    // 递归判断父类方法有没有实现
     supercls = cls->superclass;
     if (supercls  &&  !supercls->isInitialized()) {
         initializeNonMetaClass(supercls);
     }
 
     @try
     {
         //父类调用了就直接调用本类
         callInitialize(cls);

         if (PrintInitializing) {
             _objc_inform("INITIALIZE: thread %p: finished +[%s initialize]",
                          objc_thread_self(), cls->nameForLogging());
         }
     }
        
 }
 5.调用方法
 void callInitialize(Class cls)
 {
     ((void(*)(Class, SEL))objc_msgSend)(cls, @selector(initialize));
 }
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
//        objc_msgSend([ZKPerson class],@selector(printName));
        [ZKStudent alloc];
        [ZKTeacher alloc];
//        [ZKStudent printName];
//        [ZKStudent printName];
//        [ZKStudent printName];
//        [ZKStudent printName];
//        [ZKStudent printName];
        
//        objc_msgsend
    }
    return 0;
}
