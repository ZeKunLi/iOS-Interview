//
//  ClassB.h
//  Objective-C 实现“多继承”
//
//  Created by 李泽昆 on 2019/5/23.
//  Copyright © 2019 personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//定义ClassB以及其methodB
@interface ClassB : NSObject
-(void)methodB;
@end

@protocol ClassBProtocol <NSObject>
-(void)b;
@end


NS_ASSUME_NONNULL_END
