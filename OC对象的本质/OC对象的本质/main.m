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


struct NSObject_IMPL {
    Class isa;
};


struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
};

struct Zack_IMPL {
    struct Student_IMPL Student_IVARS;
    int _project;
};

@interface Student : NSObject {
    @public
    int _no;
    int _age;
}
@end


@implementation Student


@end

@interface Zack : Student {
    @public
//    int _project;
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
        NSLog(@"%zd",malloc_size((__bridge const void *)(stu)));
        
        printf("=================Zack=====================\n");
        
        Zack *zack = [[Zack alloc] init];
        
        // 内存对齐:结构体的大小必须是最大成员大小的倍数// 如当前类的实列变量大小刚好能补齐则不需要增加内存
        NSLog(@"%zd",malloc_size((__bridge const void *)(zack)));
        
        
    }
    return 0;
}
