//
//  ZKPerson.m
//  MRC
//
//  Created by ZeKun Li on 2020/8/30.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"

@interface ZKPerson () {
    ZKDog *_dog;
    int _age;
}

@end

@implementation ZKPerson

+ (instancetype)person {
    return [[[ZKPerson alloc] init] autorelease];
}

- (void)setAge:(int)age {
    _age = age;
}

- (int)age {
   return _age;
}

- (void)setDog:(ZKDog *)dog {
    if (dog != _dog) {
        [_dog release];
        _dog = [dog retain];
    }
}

- (ZKDog *)dog {
    return _dog;
}

- (void)dealloc {
    [_dog release];
    _dog = nil;
    
//    self.dog = nil;
//    - (void)setDog:(ZKDog *)nil {
//        if (_dog != nil) {
//            [_dog release];
//            _dog = [nil retain];
//        }
//    }

    
    NSLog(@"%s",__func__);
    [super dealloc];
    
}
@end
