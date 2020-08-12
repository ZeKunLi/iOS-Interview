//
//  ZKStudent.m
//  Block
//
//  Created by ZeKun Li on 2020/8/10.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKStudent.h"

@implementation ZKStudent

- (void)test {
    
    __weak typeof(self) weakself = self;
     
    self.block = ^{
        
        __strong typeof(self) strongself = weakself;
        NSLog(@"age is %ld",strongself->_age);
        NSLog(@"age is %ld",weakself.age);
    };
    
}

- (void)dealloc {
//    [super dealloc];
    NSLog(@"ZKStudent - dealloc");
}

@end
