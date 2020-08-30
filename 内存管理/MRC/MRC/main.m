//
//  main.m
//  MRC
//
//  Created by ZeKun Li on 2020/8/30.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ZKPerson.h"


//void test() {
//    // 内存泄漏，该释放对象没有被释放
//    ZKPerson *person = [[[ZKPerson alloc] init] autorelease];
//    [person retain];
//}
//
//
//void test1() {
//
//    ZKPerson *person1 = [[ZKPerson alloc] init]; // person1 1
//    ZKPerson *person2 = [[ZKPerson alloc] init]; // person2 1
//
//    ZKDog *dog = [[ZKDog alloc] init]; // dog 1
//    [person1 setDog:dog]; // dog 2
//
//    [dog release]; // dog 1
//    dog = nil; // dog 1
//
//    [person2 setDog:dog];
//
//    [[person2 dog] run];
//
//    [[person1 dog] run];
//
//    [person1 release];
//
//    [person2 release];
//}
//
//int main(int argc, char * argv[]) {
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//
//       ZKPerson *person = [[ZKPerson alloc] init]; // person 1
//
//
//       ZKDog *dog = [[ZKDog alloc] init]; // dog 1
//
//
//       [person setDog:dog]; // dog 2
//
//        [dog release]; // dog 1
//        dog = nil;
//
//        [person setDog:dog]; // dog0
//
//
//
//        int age = 18;
//
//
//        [person setAge:age];
//        age = 0;
//        NSLog(@"%d",[person age]);
////       dog = nil;
//       [[person dog] run];
//
//       [person release];
//

//    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
//}


int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        ZKPerson *person = [ZKPerson person];
        [appDelegateClassName retain];
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
