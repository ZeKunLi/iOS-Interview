//
//  ZKPerson.m
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ZKPerson.h"


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



@interface ZKPerson ()

{
    @private
    // 位域
    struct {
        unsigned int high : 1;
        unsigned int rich : 1;
        unsigned int handsome : 1;
    } _maleFlag;
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
    _maleFlag.high = high;
}

- (void)setRich:(BOOL)rich {
    _maleFlag.rich = rich;
}

- (void)setHandsome:(BOOL)handsome {
    _maleFlag.handsome = handsome;
}

- (BOOL)isHigh {
    return _maleFlag.high;
}

- (BOOL)isRich {
    return _maleFlag.rich;
}

- (BOOL)isHandsome {
    return _maleFlag.handsome;
}


@end
