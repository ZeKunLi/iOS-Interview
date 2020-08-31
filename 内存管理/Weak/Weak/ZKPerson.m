//
//  ZKPerson.m
//  Weak
//
//  Created by ZeKun Li on 2020/8/31.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"

@implementation ZKPerson
- (void)dealloc {
    NSLog(@"%s%@=%p",__func__,self.name,self);
}
@end
