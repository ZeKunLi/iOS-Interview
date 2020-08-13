//
//  ZKPerson+Eat.m
//  Category
//
//  Created by ZeKun Li on 2020/8/12.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson+Eat.h"
#import <objc/runtime.h>

@implementation ZKPerson (Eat)

- (void)setFood:(NSString *)food {
    objc_setAssociatedObject(self, @selector(food), food, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)food {
    return objc_getAssociatedObject(self, @selector(food));
}

- (void)practice {
    NSLog(@"Eat");
}





@end
