//
//  ClassC.h
//  Objective-C 实现“多继承”
//
//  Created by 李泽昆 on 2019/5/23.
//  Copyright © 2019 personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"
#import "ClassB.h"

NS_ASSUME_NONNULL_BEGIN
//定义ClassC以及其需要的methodA，methodB
@interface ClassC : NSObject <ClassAProtocol, ClassBProtocol> {
    ClassA *a;
    ClassB *b;
}

-(id)init;
-(void)methodA;
-(void)methodB;

@end

NS_ASSUME_NONNULL_END
