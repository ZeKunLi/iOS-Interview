//
//  ZKPerson.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"
#import <objc/runtime.h>

// 掩码,一般用来按位与(&)运算的
//#define ZKHighMask 1
//#define ZKRichMask 2
//#define ZKHandsomeMask 4

//#define ZKHighMask 0b00000001
//#define ZKRichMask 0b00000010
//#define ZKHandsomeMask 0b00000100

#define ZKHighMask (1<<0)
#define ZKRichMask (1<<1)
#define ZKHandsomeMask (1<<2)
#define ZKThinMask (1<<3)




@interface ZKPerson ()

{
    @private
    union {
        // 位域
        char bits;
        struct {
            char high     : 1;
            char rich     : 1;
            char handsome : 1;
            char thin     : 1;
        };
    }_maleFlag;
    
}

@end

@implementation ZKPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setHigh:(BOOL)high {
    if (high) {
        _maleFlag.bits |= ZKHighMask;
    } else {
        _maleFlag.bits &= !ZKHighMask;
    }
}

- (void)setRich:(BOOL)rich {
    if (rich) {
        _maleFlag.bits |= ZKRichMask;
    } else {
        _maleFlag.bits &= ~ZKRichMask;
    }
}

- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _maleFlag.bits |= ZKHandsomeMask;
    } else {
        _maleFlag.bits &= ~ZKHandsomeMask;
    }
}

- (void)setThin:(BOOL)thin {
    if (thin) {
        _maleFlag.bits |= ZKThinMask;
    } else {
        _maleFlag.bits &= ~ZKThinMask;
    }
}

- (BOOL)isHigh {
    return !!(_maleFlag.bits & ZKHighMask);
}

- (BOOL)isRich {
    return !!(_maleFlag.bits & ZKRichMask);
}

- (BOOL)isHandsome {
    return !!(_maleFlag.bits & ZKHandsomeMask);
}

- (BOOL)isThin {
    return !!(_maleFlag.bits & ZKThinMask);
}

- (void)setMyEnum:(MyEnum)myEnum {
    if (myEnum & MyEnumValueA) {
        NSLog(@"MyEnumValueA");
    }
    
    if (myEnum & MyEnumValueB) {
        NSLog(@"MyEnumValueB");
    }
    
    if (myEnum & MyEnumValueC) {
        NSLog(@"MyEnumValueC");
    }
}


@end
