//
//  AppDelegate.m
//  KVO(实现原理)
//
//  Created by 李泽昆 on 2019/4/13.
//  Copyright © 2019 personal. All rights reserved.
//

#import "AppDelegate.h"
#import "MObject.h"
#import "MObserver.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    MObject *obj = [[MObject alloc] init];
    MObserver *observer = [[MObserver alloc] init];
//    (lldb) po object_getClassName(obj)
//    "MObject"
    // 调用 kvo 方法监听obc 的 value 属性的变化
    [obj addObserver:observer forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
//    (lldb) po object_getClassName(obj)
//    "NSKVONotifying_MObject"
    
//    NSKVONotifying_MObject 的setter实现
//- (void)setValue:(id)obj {
//    [self willChangeValueForKey:"keyPath"];
// 调用父类实现,也即原类的实现
//    [super setValue:obj];
//    [self didChangeValueForKey:"keyPath"];
//}
    
    // 通过 setter 方法修改 value
    obj.value = 2;
    
    // 1 通过 kvc 设置 value 是否能生效? 是
    [obj setValue:@3 forKey:@"value"];
    // 2 通过成员变量直接赋值 value 是否能生效？ 否
    [obj increase];
    

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
