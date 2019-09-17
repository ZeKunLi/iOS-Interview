//
//  ClassA.h
//  Objective-C 实现“多继承”
//
//  Created by 李泽昆 on 2019/5/23.
//  Copyright © 2019 personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//定义ClassA以及其methodA
@interface ClassA : NSObject
-(void)methodA;
@end

@protocol ClassAProtocol <NSObject>
-(void)a;
@end

NS_ASSUME_NONNULL_END
