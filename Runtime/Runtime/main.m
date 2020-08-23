//
//  main.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKPerson.h"
#import <objc/runtime.h>
#import "ZKDog.h"
#import "ZKStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        ZKPerson *person = [[ZKPerson alloc] init];
        
//        NSLog(@"====%@",person.name);
//        person.name = @"person";
        
        [person setValue:@"name" forKey:@"name"];
//        objc_setAssociatedObject(person, @"name", @"Zack", OBJC_ASSOCIATION_COPY_NONATOMIC);
//        person.high = NO;
//
//        __weak weakPerson = person;
//        person.rich = NO;
//        person.handsome = NO;
//        person.thin = YES;
//        [person setMyEnum:(MyEnumValueA | MyEnumValueB | MyEnumValueC)];
//        NSLog(@"高：%d 富：%d 帅：%d 瘦：%d",person.isHigh,person.isRich,person.isHandsome,person.isThin);
        
        
        
        SEL sel1 = sel_registerName("test");
        
        SEL sel2 = @selector(test);
        
        if (sel1 == sel2) {
            NSLog(@"sel1:%p = sel2:%p",sel1,sel2);
            
        }
        
        
        NSLog(@"%s",sel_getName(sel1));
        NSLog(@"%@",NSStringFromSelector(sel2));
        
        
        
        
        ZKDog *dog = [[ZKDog alloc] init];
//        [dog test];
        // 访问私有方法,dog 方法并没有暴露
//        [dog performSelector:@selector(test)];
        
        [ZKDog test];
        
//        [dog performSelector:@selector(beta)];
        [dog beta];
        
        [dog test:18];
        
        [ZKDog classTest];

        
        
        [person setNike:@"往事随风"];
        
        NSLog(@"@dynamic nike == %@",[person nike]);
        
        [person setAge:20];
        
        NSLog(@"@dynamic age == %d",[person age]);
        
        
        
        ZKStudent *student = [[ZKStudent alloc] init];
        [student run];
        
        
#pragma mark -isKindOfClass&isMemberOfClass
        // - isKindOfClass 判断当前类对象是否是传入的子类或者当前类的类对象
        // - isMemberOfClass 判断当前对象的类对象是否是传入对象的类
        if ([person isKindOfClass:[NSObject class]]) {
            NSLog(@"YES");
        }
        
        if ([ZKPerson isMemberOfClass:object_getClass([ZKPerson class])]) {
            NSLog(@"元类对象相同YES");
        }
        
        if ([ZKPerson isMemberOfClass:object_getClass([ZKDog class])]) {
            NSLog(@"元类对象相同YES");
        }
    }
    return 0;
}
