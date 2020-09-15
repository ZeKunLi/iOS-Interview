//
//  ViewController.m
//  KVO(实现原理)
//
//  Created by 李泽昆 on 2019/4/13.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "ZKPerson.h"

@interface ViewController ()
@property (nonatomic, strong) ZKPerson *person1;
@property (nonatomic, strong) ZKPerson *person2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person1 = [[ZKPerson alloc] init];
    self.person2 = [[ZKPerson alloc] init];
    
    
    NSLog(@"person1 添加 KVO监听之前的类对象 = %@|%@",
          [self.person1 class],
          [self.person2 class]);
    NSLog(@"person1 添加 KVO监听之前 setAge IMP%p|%p",
          [self.person1 methodForSelector:@selector(setAge:)],
          [self.person1 methodForSelector:@selector(setAge:)]);
    [self printMethodNamesOfClass:object_getClass(self.person1)];
    
    [self.person1 addObserver:self forKeyPath:NSStringFromSelector(@selector(age)) options:NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"person1 添加 KVO监听之后的类对象 = %@|%@",
          [self.person1 class],
          [self.person2 class]);
    NSLog(@"person1 添加 KVO监听之后的真实类对象 = %@|%@",
    object_getClass(self.person1),
    object_getClass(self.person2));
    NSLog(@"person1 添加 KVO监听之后 setAge IMP%p|%p",
          [self.person1 methodForSelector:@selector(setAge:)],
          [self.person1 methodForSelector:@selector(setAge:)]);
    [self printMethodNamesOfClass:object_getClass(self.person1)];
    
}

// 打印方法列表和实现地址
- (void)printMethodNamesOfClass:(Class)cls {
    
    unsigned count = 0;
    Method *methods = class_copyMethodList(cls, &count);
    NSLog(@"================================");
    for (int i = 0; i < count; i++) {
        Method method = methods[i];
        NSLog(@"%p",method_getImplementation(method));
        NSLog(@"%@",NSStringFromSelector(method_getName(method)));
    }
    free(methods);
    
}




@end
