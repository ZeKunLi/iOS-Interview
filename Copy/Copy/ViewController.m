//
//  ViewController.m
//  Copy
//
//  Created by ZeKunLi on 2019/9/17.
//  Copyright © 2019 ZeKunLi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     1 浅拷贝和深拷贝的区别？
     浅拷贝：只复制指向对象的指针，而不复制引用对象本身。
     深拷贝：复制引用对象本身。内存中存在了两份独立对象本身，当修改A时，A_copy不变。
     
     */
    
    /*
     
     2 系统对象的 copy 与 mutableCopy 方法
     接收到copy和mutableCopy消息时，都遵循以下准则：
     1. copy 返回的是不可变对象（immutableObject）；如果用copy返回值调用mutable对象的方法就会crash。
     2. mutableCopy 返回的是可变对象（mutableObject）。
     
     只有对不可变对象进行copy操作是指针复制（浅复制），其它情况都是内容复制（深复制）！
     
     */
    
    NSMutableArray * array = [NSMutableArray array];
    self.array = array;
    [_array addObject:@"1"];
    
    // 非集合类对象的copy与mutableCopy
    // 在非集合类对象中，对不可变对象进行copy操作，是指针复制，mutableCopy操作是内容复制；
    // 对可变对象进行copy和mutableCopy都是内容复制。用代码简单表示如下：
    NSString *str = @"hello word!";
    NSString *strCopy = [str copy];
    // 指针复制，strCopy与str的地址一样
    NSMutableString *strMCopy = [str mutableCopy];
//    // 内容复制，strMCopy与str的地址不一样
//    NSMutableString *mutableStr = [NSMutableString stringWithString: @"hello word!"];
//    NSString *strCopy = [mutableStr copy];
//     // 内容复制
//    NSMutableString *strMCopy = [mutableStr mutableCopy];
    
    /*
     3.写一个 setter 方法用于完成 @property (nonatomic, retain) NSString *name，写一个 setter 方法用于完成 @property (nonatomic, copy) NSString *name
     
     */
    
    
    /*
  4.如果对一个可变数组进行深拷贝，则会对可变数组里面的元素也会进行重新复制一份吗？答：不会，深拷贝，可变数组就是一个箱子，如果进行深拷贝，则会再拷贝出一个新的箱子，但箱子里面的元素不会拷贝出新的。
    */
    NSString *string1 = @"content";
    NSString *string2 = @"content";
    NSString *string3 = @"content";
    
    
    NSLog(@"%p",string1);
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:string1,string2,string3, nil];
    
    
    for (NSString * str in arr) {
        NSLog(@"%p",str);
    }
    
    NSArray * arr2 = arr.copy;
    
    
    for (NSString * str in arr2) {
        NSLog(@"%p",str);
    }
    
}


@end
