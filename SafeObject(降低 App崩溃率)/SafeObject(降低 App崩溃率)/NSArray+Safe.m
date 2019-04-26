//
//  NSArray+Safe.m
//  SafeObject(降低 App崩溃率)
//
//  Created by 李泽昆 on 2019/4/12.
//  Copyright © 2019 personal. All rights reserved.
//

#import "NSArray+Safe.h"
#import <objc/runtime.h>
@implementation NSArray (Safe)
// 替代objectAtIndex,防止数组越界
- (id)safeObjectAtIndex:(NSInteger )index {
    if (index > self.count - 1 || !self.count) {
        @try {
            return [self safeObjectAtIndex:index];
        }
        @catch (NSException *exception) {
            NSLog(@"exception: %@", exception.reason);
            return nil;
        }
        
    }else {
        return [self safeObjectAtIndex:index];
    }
}

+ (void)load {
    
    Method originalMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    Method safeMethod = class_getInstanceMethod([NSArray class], @selector(safeObjectAtIndex:));
    method_exchangeImplementations(originalMethod, safeMethod);

}
@end
