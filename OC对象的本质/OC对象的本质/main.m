//
//  main.m
//  OC对象的本质
//
//  Created by ZeKun Li on 2020/7/31.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
/*
    class_getInstanceSize()对象存储需要分配多少空间，对象的实例变量需要多少存储空间
    malloc_size() 实际需要分配多少空间,指针指向的那块内存有多大
    object_getClass() 传进去实例对象，返回类对象。传进去类对象，返回元类对象。传入元类对象，返回根原类对象。
    objc_getClass() 传进去字符串、返回类对象地址
 */

struct NSObject_IMPL {
    Class isa;
};


struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
    int _height;
};

struct Zack_IMPL {
    struct Student_IMPL Student_IVARS;
    int _project;
};

@interface Student : NSObject {
    @public
    int _no;
    int _age;
    int _height;
}
@end


@implementation Student


@end

@interface Zack : Student {
    @public
    int _project;
}

@end

@implementation Zack


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSObject *obj = [[NSObject alloc] init];
        
        // 获取NSObject实例对象的成员变量的所占用的存储空间 >> 8
        NSLog(@"%zd",class_getInstanceSize([NSObject class]));
        
        // 获得obj指针所指向内存的大小 >> 16
        NSLog(@"%zd",malloc_size((__bridge const void *)(obj)));
        
        
        printf("=================Student=====================\n");
        
        Student *stu = [[Student alloc] init];
        stu->_age = 18;
        stu->_no = 8;
        // 获得obj指针所指向内存的大小 >> 16
        
        struct Student_IMPL *impl = (__bridge struct Student_IMPL *)(stu);
        
        NSLog(@"no is %d, age is%d",impl->_no,impl->_age);
        NSLog(@"%zd",class_getInstanceSize([Student class]));
        NSLog(@"%zd",malloc_size((__bridge const void *)(stu)));
        
        printf("=================Zack=====================\n");
        
        Zack *zack = [[Zack alloc] init];
        zack->_project = 2;
        // 内存对齐:结构体的大小必须是最大成员大小的倍数// 如当前类的实列变量大小刚好能补齐则不需要增加内存
        NSLog(@"class_getInstanceSize:%zd",class_getInstanceSize([Zack class]));
        
        // sizeof 在编译的时候决定的
        NSLog(@"sizeof:%zd",sizeof(struct Zack_IMPL));
        
        // malloc_size
        NSLog(@"malloc_size:%zd",malloc_size((__bridge const void *)(zack)));
        
        
        printf("===========================================\n");
        printf("=================类对象=====================\n");
        printf("===========================================\n");
        
        // class方法返回的一直是class对象,类对象
//        Class class1 = [[[[zack class] class] class] class];
        
        Class class1 = [zack class];
        
        Class class2 = [Zack class];
        
        Class class3 = object_getClass(zack);
        
        
        Class class4 = [stu class];
        
        Class class5 = [Student class];
        
        Class class6 = object_getClass(stu);

        
        
        NSLog(@"Zack\n%p\n%p\n%p",class1,class2,class3);
        
        NSLog(@"Student\n%p\n%p\n%p",class4,class5,class6);
        
        NSLog(@"isMetaClass%d",class_isMetaClass(class1));
        
        printf("===========================================\n");
        printf("=================元类对象===================\n");
        printf("===========================================\n");
        
        
        Class meatClass1 = object_getClass(class1);
        Class meatClass2 = object_getClass(class2);
        Class meatClass3 = object_getClass(class3);
        Class meatClass4 = object_getClass(class4);
        Class meatClass5 = object_getClass(class5);
        Class meatClass6 = object_getClass(class6);
        
        
        NSLog(@"Zack\n%p\n%p\n%p",meatClass1,meatClass2,meatClass3);
        
        NSLog(@"Student\n%p\n%p\n%p",meatClass4,meatClass5,meatClass6);
        
        
        NSLog(@"isMetaClass%d",class_isMetaClass(meatClass1));
        
    }
    return 0;
}
