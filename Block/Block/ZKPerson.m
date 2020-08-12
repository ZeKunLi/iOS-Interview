//
//  ZKPerson.m
//  Block
//
//  Created by ZeKun Li on 2020/8/5.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"
struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};

struct __ZKPerson__test_block_impl_0 {
  struct __block_impl impl;
  struct __ZKPerson__test_block_desc_0* Desc;
  ZKPerson *self;
//  __ZKPerson__test_block_impl_0(void *fp, struct __ZKPerson__test_block_desc_0 *desc, ZKPerson *_self, int flags=0) : self(_self) {
//    impl.isa = &_NSConcreteStackBlock;
//    impl.Flags = flags;
//    impl.FuncPtr = fp;
//    Desc = desc;
//  }
};


void (^block)(void);
@implementation ZKPerson


//static void _I_ZKPerson_test(ZKPerson * self, SEL _cmd) {
//    block = ((void (*)())&__ZKPerson__test_block_impl_0((void *)__ZKPerson__test_block_func_0, &__ZKPerson__test_block_desc_0_DATA, self, 570425344));
//
//    ((void (*)(__block_impl *))((__block_impl *)block)->FuncPtr)((__block_impl *)block);
//}

- (void)test {
    block = ^{
        // self 也会被捕获
        NSLog(@"%@",self->_name);
    };
    
    block();
}


//static instancetype _I_ZKPerson_initWithName_(ZKPerson * self, SEL _cmd, NSString *name) {
//    self = ((ZKPerson *(*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("ZKPerson"))}, sel_registerName("init"));
//    if (self) {
//        ((void (*)(id, SEL, NSString * _Nonnull))(void *)objc_msgSend)((id)self, sel_registerName("setName:"), (NSString *)name);
//        ((void (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("test"));
//    }
//    return self;
//}
- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        [self test];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"ZKPerson - dealloc");
    
    
}
@end
