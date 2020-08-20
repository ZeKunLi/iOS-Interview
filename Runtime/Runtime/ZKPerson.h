//
//  ZKPerson.h
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    MyEnumValueA = 1<<0,
    MyEnumValueB = 1<<1,
    MyEnumValueC = 1<<2,
} MyEnum;


@interface ZKPerson : NSObject

//@property (nonatomic, assign, getter=isHigh) BOOL high;
//@property (nonatomic, assign, getter=isRich) BOOL rich;
//@property (nonatomic, assign, getter=isHandsome) BOOL handsome;

@property (nonatomic, assign) MyEnum myEnum;
@property (nonatomic, copy) NSString *name;

- (void)setHigh:(BOOL)high;

- (void)setRich:(BOOL)rich;

- (void)setHandsome:(BOOL)handsome;

- (void)setThin:(BOOL)thin;

- (BOOL)isHigh;

- (BOOL)isRich;

- (BOOL)isHandsome;

- (BOOL)isThin;

- (void)test;

@end

NS_ASSUME_NONNULL_END
