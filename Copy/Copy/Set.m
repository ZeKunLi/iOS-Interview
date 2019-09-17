//
//  Set.m
//  Copy
//
//  Created by ZeKunLi on 2019/9/17.
//  Copyright © 2019 ZeKunLi. All rights reserved.
//

#import "Set.h"

@implementation Set
- (void)setStrong:(NSString *)strong {
    [strong retain];
    [_strong release];
    _strong = strong;
}

- (void)setScopy:(NSString *)scopy {
    id t = [scopy copy];
    [_scopy release];
    _scopy = t;
}


@end
