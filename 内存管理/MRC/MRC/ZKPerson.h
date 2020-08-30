//
//  ZKPerson.h
//  MRC
//
//  Created by ZeKun Li on 2020/8/30.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKDog.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZKPerson : NSObject

@property (nonatomic, retain) NSString *name;

+ (instancetype)person;

- (void)setDog:(ZKDog *)dog;

- (ZKDog *)dog;

- (void)setAge:(int)age;

- (int)age;

@end

NS_ASSUME_NONNULL_END
