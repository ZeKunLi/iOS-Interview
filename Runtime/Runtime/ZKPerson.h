//
//  ZKPerson.h
//  Runtime
//
//  Created by ZeKun Li on 2020/8/16.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKPerson : NSObject

//@property (nonatomic, assign, getter=isHigh) BOOL high;
//@property (nonatomic, assign, getter=isRich) BOOL rich;
//@property (nonatomic, assign, getter=isHandsome) BOOL handsome;

- (void)setHigh:(BOOL)high;

- (void)setRich:(BOOL)rich;

- (void)setHandsome:(BOOL)handsome;

- (BOOL)isHigh;

- (BOOL)isRich;

- (BOOL)isHandsome;

@end

NS_ASSUME_NONNULL_END
