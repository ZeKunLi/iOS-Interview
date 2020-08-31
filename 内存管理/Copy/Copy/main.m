//
//  main.m
//  Copy
//
//  Created by ZeKun Li on 2020/8/30.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKPerson.h"

void test1() {
    NSString *str1 = [NSString stringWithFormat:@"test"];
    NSString *str2 = [str1 copy]; // 返回的是 NSString
    
    NSMutableString *str3 = [str1 mutableCopy]; // 返回的是 NSMutableString
    NSLog(@"\n%p\n%p\n%p",str1,str2,str3);
}


void test2() {
    
    NSString *str1 = [[NSString alloc] initWithFormat:@"test1111111111"];
    NSLog(@"%ld",[str1 retainCount]);
    NSString *str2 = [str1 copy]; // 返回的是 NSString copy == retain 浅拷贝 指针拷贝
    NSLog(@"%ld",[str1 retainCount]);
    NSMutableString *str3 = [str1 mutableCopy]; // 返回的是 NSMutableString 深拷贝
    
    
    NSLog(@"\n%p\n%p\n%p",str1,str2,str3);
    
    [str3 release];
    [str2 release];
    [str1 release];
    
}

void test3() {
    NSMutableString *str1 = [[NSMutableString alloc] initWithFormat:@"abcdefg1234567"];
    NSString *str2 = [str1 copy]; // 返回的是 NSString 深拷贝
    NSMutableString *str3 = [str1 mutableCopy]; // 返回的是 NSMutableString
    NSLog(@"\n%p\n%p\n%p",str1,str2,str3);
    
    [str1 appendFormat:@"abc"];
    
    [str3 appendFormat:@"abd"];
    
    
    NSLog(@"%@",str1);
    
    NSLog(@"%@",str3);
    
    [str1 release];
    [str2 release];
    [str3 release];
    
}

void test4() {
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"a",@"b", nil];
    NSArray *array2 = [array1 copy]; // 浅拷贝
    NSMutableArray *array3 = [array1 mutableCopy]; // 深拷贝
    
    NSLog(@"\n%p\n%p\n%p",array1,array2,array3);

    [array1 release];
    [array2 release];
    [array3 release];
}

void test5() {
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:@"a",@"b", nil];
    NSArray *array2 = [array1 copy]; // 深拷贝
    NSMutableArray *array3 = [array1 mutableCopy]; // 深拷贝
    
    NSLog(@"\n%p\n%p\n%p",array1,array2,array3);

    [array1 release];
    [array2 release];
    [array3 release];
}

void test6() {
    NSDictionary *array1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"zack",@"name", nil];
    NSDictionary *array2 = [array1 copy]; // 浅拷贝
    NSMutableDictionary *array3 = [array1 mutableCopy]; // 深拷贝
    
    NSLog(@"\n%p\n%p\n%p",array1,array2,array3);

    [array1 release];
    [array2 release];
    [array3 release];
}


void test7() {
    NSMutableDictionary *array1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"zack",@"name", nil];
    NSDictionary *array2 = [array1 copy]; // 深拷贝
    NSMutableDictionary *array3 = [array1 mutableCopy]; // 深拷贝
    
    NSLog(@"\n%p\n%p\n%p",array1,array2,array3);

    [array1 release];
    [array2 release];
    [array3 release];
}
void test8() {
    ZKPerson *person = [[ZKPerson alloc] init];
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    person.datas = datas;
    
    [person.datas addObject:@"test"];
}


void test9() {
    ZKPerson *person = [[ZKPerson alloc] init];
    person.age = 18;
    person.height = 175;
    person.name = @"zack";
    
    ZKPerson *clonePerson = [person copy];
    clonePerson.age = 35;
    NSLog(@"%@",person);
    NSLog(@"%@",clonePerson);
    
    NSLog(@"%p",person);
    NSLog(@"%p",clonePerson);
    
    [clonePerson release];
    [person release];
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        test9();
    }
    return 0;
}
