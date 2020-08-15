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
 MARK:- load 关键代码（直接调用）
 1.初始化
 void _objc_init(void)
 {
     _dyld_objc_notify_register(&map_images, load_images, unmap_image);
 }
 2.加载镜像
 void
 load_images(const char *path __unused, const struct mach_header *mh)
 {
     // Discover load methods
     {
         mutex_locker_t lock2(runtimeLock);
         // 把所有需要load的类 加载一个list里面
         prepare_load_methods((const headerType *)mh);
     }

     // Call +load methods (without runtimeLock - re-entrant)
    // 调用 load 方法
     call_load_methods();
 }
 3.准备所需要的 loads 列表
 void prepare_load_methods(const headerType *mhdr)
 {
    // 先调用类
     classref_t const *classlist =
         _getObjc2NonlazyClassList(mhdr, &count);
     for (i = 0; i < count; i++) {
         // 规划类的加载
         schedule_class_load(remapClass(classlist[i]));
     }
    // 在调用分类
     category_t * const *categorylist = _getObjc2NonlazyCategoryList(mhdr, &count);
     for (i = 0; i < count; i++) {
         category_t *cat = categorylist[i];
         Class cls = remapClass(cat->cls);
         if (!cls) continue;  // category for ignored weak-linked class
         realizeClassWithoutSwift(cls, nil);
         ASSERT(cls->ISA()->isRealized());
         add_category_to_loadable_list(cat);
     }
 }
 4. 规划类 load
 static void schedule_class_load(Class cls)
 {
     if (!cls) return;

     if (cls->data()->flags & RW_LOADED) return;

     // Ensure superclass-first ordering
     // 递归调用，先调用父类
     schedule_class_load(cls->superclass);

     add_class_to_loadable_list(cls);
     cls->setInfo(RW_LOADED);
 }
 5. 加载 load 方法 （分类类似）
 void call_load_methods(void)
 {
     void *pool = objc_autoreleasePoolPush();

     do {
         // 1. Repeatedly call class +loads until there aren't any more
         while (loadable_classes_used > 0) {
            // 调用类的 loads
             call_class_loads();
         }

         // 2. Call category +loads ONCE
         more_categories = call_category_loads();

         // 3. Run more +loads if there are classes OR more untried categories
     } while (loadable_classes_used > 0  ||  more_categories);

     objc_autoreleasePoolPop(pool);

 }
 6.调用类 load 方法 （分类类似）
 static void call_class_loads(void)
 {
     // Call all +loads for the detached list.
     for (i = 0; i < used; i++) {
         Class cls = classes[i].cls;
         load_method_t load_method = (load_method_t)classes[i].method;
         if (!cls) continue;
         (*load_method)(cls, @selector(load));
     }

 }

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
//        [ZKStudent alloc];
//        [ZKTeacher alloc];
        [ZKStudent printName];
//        [ZKStudent printName];
//        [ZKStudent printName];
//        [ZKStudent printName];
//        [ZKStudent printName];
        
//        objc_msgsend
    }
    return 0;
}
