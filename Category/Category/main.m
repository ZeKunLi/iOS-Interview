//
//  main.m
//  Category
//
//  Created by ZeKun Li on 2020/8/12.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "ZKPerson.h"
//#import "ZKPerson+Eat.h"
//#import "ZKPerson+Study.m" //后编译的先执行,跟引用不引用没关系
//#import "ZKPerson+Sleep.m"
//#import "ZKPerson+Play.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Class currentClass = [ZKPerson class];
        ZKPerson *my = [[ZKPerson alloc] init];

        if (currentClass) {
            unsigned int methodCount;
            Method *methodList = class_copyMethodList(currentClass, &methodCount);
            IMP lastImp = NULL;
            SEL lastSel = NULL;
            for (NSInteger i = 0; i < methodCount; i++) {
                Method method = methodList[i];
                NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(method))
                                                          encoding:NSUTF8StringEncoding];
                if ([@"practice" isEqualToString:methodName]) {
                    lastImp = method_getImplementation(method);
                    lastSel = method_getName(method);
                }
            }
            typedef void (*fn)(id,SEL);

            if (lastImp != NULL) {
                fn f = (fn)lastImp;
                f(my,lastSel);
            }
            
            free(methodList);
        }
        
//        ZKPerson *person = [[ZKPerson alloc] init];
//        
//        [person practice];
//        #pragma GCC diagnostic ignored "-Wundeclared-selector"
        
//        SEL practice = NSSelectorFromString(@"practice");
//        [person performSelector:practice];
//        #pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
        
    }
    return 0;
}
