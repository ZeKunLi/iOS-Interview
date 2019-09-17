//
//  ClassC.m
//  Objective-C 实现“多继承”
//
//  Created by 李泽昆 on 2019/5/23.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ClassC.h"

@implementation ClassC
- (instancetype)init
{
    self = [super init];
    if (self) {
        a=[[ClassA alloc] init];
        b=[[ClassB alloc] init];
    }
    return self;
}

-(void)methodA{
    [a methodA];
}

-(void)methodB{
    [b methodB];
}
@end
