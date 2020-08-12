//
//  main.m
//  isa和superclass
//
//  Created by ZeKun Li on 2020/8/2.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "ZKPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        //instance 对象
        ZKPerson *person = [[ZKPerson alloc] init];
        person->age = 18;
        
        Class class = [ZKPerson class];
        
        [person personInstanceMethond];
        
        
        Class meatClass = object_getClass(class);
        
        class_isMetaClass(meatClass);
        
        
        
    }
    return 0;
}
