//
//  main.m
//  Block
//
//  Created by ZeKun Li on 2020/8/4.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKPerson.h"
#import "ZKStudent.h"

typedef void (^ZKBlock)(void);

ZKBlock myblock()
{
    int age = 2020;
    return [^{
        NSLog(@"返回 block%d",age);
    } copy];
}

struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr; //函数地址
};


// 描述
struct __main_block_desc_0 {
  size_t reserved; // 0 保留变量
  size_t Block_size; // block 大小
};
// __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};


// 定义的 Block 底层就是结构体
struct __main_block_impl_0 {
  struct __block_impl impl;//变量 8
  struct __main_block_desc_0* Desc; //8
  int count; //外部变量 4
    //构造函数                                                                                  自动赋值（C++语法）
//  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _count, int flags=0) : count(_count) {
//    impl.isa = &_NSConcreteStackBlock;
//    impl.Flags = flags;
//    impl.FuncPtr = fp;
//    Desc = desc;
//  }
};


struct __main_block_desc_9 {
  size_t reserved; // 0 保留变量
  size_t Block_size; // block 大小
    void (*copy)(void);
    void (*dispose)(void);
};

struct __main_block_impl_9 {
  struct __block_impl impl;
  struct __main_block_desc_9* Desc;
  struct __Block_byref_num_1 *num; // by ref
};


struct __Block_byref_num_1 {
  void *__isa;
  struct _Block_byref_num_1 *__forwarding;
  int __flags;
  int __size;
  int num;
};




int _count = 10;
static int _number = 20;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
         // MARK: - Block本质
        // insert code here...
        
        //        auto int count = 10;
        //                                                                                     函数地址                 block 描述     捕获变量
        // void(*block)(int , int ) =((void (*)(int, int))&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, count));
        
        auto int count = 10;
        static int number = 20;
        void(^block)(int , int ) =^(int a,int b) {
            
            NSLog(@"Hello, auto Count=%d",count);
            NSLog(@"Hello, static number=%d",number);
            NSLog(@"Hello, a=%d!",a);
            NSLog(@"Hello, b=%d!",b);
            NSLog(@"Hello, Global _count%d",_count);
            NSLog(@"Hello, Global static _number%d",_number);
            // block 封装的执行函数
//            static void __main_block_func_0(struct __main_block_impl_0 *__cself, int a, int b) {
//            int count = __cself->count; // bound by copy
//
//
//                      NSLog((NSString *)&__NSConstantStringImpl__var_folders_60_xkt_x_6j5kx1fnmf01yjhkpw0000gn_T_main_c31161_mi_0,count);
//                      NSLog((NSString *)&__NSConstantStringImpl__var_folders_60_xkt_x_6j5kx1fnmf01yjhkpw0000gn_T_main_c31161_mi_1,a);
//                      NSLog((NSString *)&__NSConstantStringImpl__var_folders_60_xkt_x_6j5kx1fnmf01yjhkpw0000gn_T_main_c31161_mi_2,b);
//                      NSLog((NSString *)&__NSConstantStringImpl__var_folders_60_xkt_x_6j5kx1fnmf01yjhkpw0000gn_T_main_c31161_mi_3);
//                      NSLog((NSString *)&__NSConstantStringImpl__var_folders_60_xkt_x_6j5kx1fnmf01yjhkpw0000gn_T_main_c31161_mi_4);
//                  }
        };
        count = 20;
        
        struct __main_block_impl_0 *blockStruct  = (__bridge struct __main_block_impl_0 *)block;
        printf("%p", blockStruct);
        // 等于调用 block 对象里面的 FuncPtr 函数地址,函数地址指向代码内部的 Block
//        ((void (*)(__block_impl *, int, int))((__block_impl *)block)->FuncPtr)((__block_impl *)block, 2, 10);
        block(2,10);
        
        NSLog(@"%@",[block class]);
        NSLog(@"%@",[[block class] superclass]);
        NSLog(@"%@",[[[block class] superclass] superclass]);
        NSLog(@"%@",[[[[block class] superclass] superclass] superclass]);
        
        
        // __NSGlobalBlock__ :没有访问 auto 变量
        void (^block1)(void) = ^ {
            NSLog(@"Hello Word!");
        };
        
        int age = 18;
        // __NSStackBlock__ :访问了 auto 变量 | ARC 在编译时做了copy操作  __NSMallocBlock__ 多次 copy 只会引用计数+1
        void (^block2)(void) = [^ {
            NSLog(@"Hello -age%d!",age);
        } copy];
        
        NSLog(@"%@ %@ %@",[block1 class],[block2 class],[^{
            NSLog(@"Hello -age%d!",age);
        } class]);
        
        block1();
        block2();
        
        
        
        __block int var = 18;
        
        void (^block4)(void) = [^ {
            var = 19;
        } copy];
         
        block4();
        
        NSLog(@"Hello Block4 %d",var);
        // MARK: - Block Copy ARC 自动 Copy 操作
        // 1.block作为函数返回值时
        ZKBlock block5 = myblock();
        
        block5();
        
        NSLog(@"block5 %@",[block5 class]);
        
        int page = 20;
        // 2.将block赋值给__strong指针时
        ZKBlock block6 = [^{
            NSLog(@"%d",page);
        } copy];
        
        NSLog(@"block6 %@",[block6 class]);
        
        // 3.block作为Cocoa API中方法名含有usingBlock的方法参数时
        [@[] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
        }];
        
        // 4.block作为GCD API的方法参数时
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });
        
        // MARK: - 对象类型的 auto 变量
        
        
//        static struct __main_block_desc_8 {
//          size_t reserved;
//          size_t Block_size;
//          void (*copy)(struct __main_block_impl_8*, struct __main_block_impl_8*);
//          void (*dispose)(struct __main_block_impl_8*);
//        } __main_block_desc_8_DATA = { 0, sizeof(struct __main_block_impl_8), __main_block_copy_8, __main_block_dispose_8};
        
        ZKBlock block7;
        {
            __strong ZKPerson *person = [[ZKPerson alloc] init];
            person.name = @"zack";
            __weak ZKPerson *weakPerson = person;
            block7 = ^{
                NSLog(@"%@",weakPerson.name);
            };
            
            
            NSLog(@"=============");
            block7();
        }
        
        NSLog(@"=============");
        
        
        // MARK: - __block本质
        __block int num = 10;
        
        //__block 在 MRC 情况下不会对包装的变量产生强引用
        
        __block ZKPerson *person = [[ZKPerson alloc] init];
        
//        NSMutableArray *array = @[].mutableCopy;
        
        
        
        ZKBlock block8 = ^{
            num = 1;
//            person = nil;
//            [array addObject:@"123"];
            
        };
        
        block8();
        
        struct __main_block_impl_9 *blockStruct1 = (__bridge struct __main_block_impl_9 *)block8;
//        p/x &(blockStruct1->num->num)
        NSLog(@"%p",&num);
        
        
        // MARK: - block内存管理
        
        
        ZKBlock block9;
        {
             ZKStudent *student = [[ZKStudent alloc] init];
            __block __weak ZKStudent *weakStuden = student;
            block9 = ^{
                NSLog(@"%@",weakStuden);
                               
            };
        }
        
       
                
        block9();
        
        
        
        // MARK: - block循环引用
        
        // student->ZKStudent._block-> <-block.student
        __block ZKStudent *arcStudent = [[ZKStudent alloc] init];
        [arcStudent test];
//        __weak:不会产生强引用,指向的对象销毁时,会自动让指针置为nil
//        __unsafe_unretaind:不会产生强引用、不安全,指向的对象销毁时,指针存储的地址不变
//        __block:会对产生多循环引用,需要手动解环，必须调用 block,然后对变量指针置为nil

//        __weak typeof(student) weakStudent = student;
//        __unsafe_unretained
//        student.age = 18;
//        student.block = ^{
//            NSLog(@"ZKStudent age = %ld",(long)student.age);
//        };
        
//        block->__Block_byref_student_->studen->block
        arcStudent.block = ^{
            NSLog(@"ZKStudent-arc age = %ld",(long)arcStudent.age);
            // __Block_byref_student_ ❌ studen
            arcStudent = nil;
        };
        
        arcStudent.block();
        
        
        // TODO: - MRC
        // MRC 不能使用 __weak
//        __unsafe_unretained ZKStudent *mrcStudent = [[ZKStudent alloc] init];
//
//
//        [mrcStudent.block = ^{
//            NSLog(@"ZKStudent-mrc age = %ld",arcStudent.age);
//        } copy];
//
//        [mrcStudent release];
//
//

        __block ZKStudent *mrcStudent = [[ZKStudent alloc] init];
        [mrcStudent.block = ^{
            NSLog(@"ZKStudent-mrc age = %ld",arcStudent.age);
        } copy];

//        [mrcStudent release];
        
        
        
        
        
    }
    return 0;
}
