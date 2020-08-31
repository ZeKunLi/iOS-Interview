//
//  ZKPerson.m
//  Copy
//
//  Created by ZeKun Li on 2020/8/31.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"

@implementation ZKPerson

@synthesize age = _age;
- (void)setAge:(int)age {
    _age = age;
}

- (int)age {
    return _age;
}

- (void)setHeight:(int)height {
    _height = height;
}

@synthesize height = _height;
- (int)height {
    return _height;
}

- (void)setName:(NSString *)name {
    if (_name != name) {
        [_name release];
        _name = [name retain];
    }
}

@synthesize name = _name;
- (NSString *)name {
    return _name;
}

@synthesize datas = _datas;
- (void)setDatas:(NSMutableArray *)datas {
    if (_datas != datas) {
        [_datas release];
        _datas = [datas retain];
    }
}

- (NSMutableArray *)datas {
    return _datas;
}

- (id)copyWithZone:(struct _NSZone *)zone {
    
    ZKPerson *person = [[ZKPerson allocWithZone:zone] init];
    person.age = self.age;
    person.height = self.height;
    person.name = self.name;
    return person;
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"%s age is %d height is %d name is %@",__func__,_age,_height,_name];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
    [super dealloc];
}

@end
