//
//  ZKPerson.m
//  isa和superclass
//
//  Created by ZeKun Li on 2020/8/2.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"

@interface ZKPerson () <NSCopying> 

@end

@implementation ZKPerson

+ (void)personClassMethond {
    
}

- (void)personInstanceMethond {
    
}



- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return nil;
}

@end
