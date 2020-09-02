//
//  ZKPerson.m
//  Copy
//
//  Created by ZeKun Li on 2020/8/31.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"
#import <objc/runtime.h>

@implementation ZKPerson

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
        _datas = [[NSMutableArray alloc] init];
        _friends = [[NSMutableSet alloc] init];
    }
    return self;
}

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
    
    id copyObject = [[[self class] alloc] init];
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);
    
    for (int  i = 0; i < count; i++) {
        NSString *key =[[NSString stringWithUTF8String:ivar_getName(ivars[i])] substringFromIndex:1];
        [copyObject setValue:[self valueForKey:key] forKey:key];
    }
    
    return copyObject;
}

- (id)deepCopy {
    ZKPerson *copy = [[[self class] alloc] initWithName:_name];
    copy->_friends = [[NSMutableSet alloc] initWithSet:_friends copyItems:YES];
    copy->_datas = [[NSMutableArray alloc] initWithArray:_datas copyItems:YES];
    return copy;
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"%s age is %d height is %d name is %@",__func__,_age,_height,_name];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
    [super dealloc];
}

@end
