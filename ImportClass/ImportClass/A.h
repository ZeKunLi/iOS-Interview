//
//  A.h
//  ImportClass
//
//  Created by ZeKunLi on 2020/5/20.
//  Copyright © 2020 luckin coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "B.h"
// @class 可以解决头文件的相互包含
@class B;
NS_ASSUME_NONNULL_BEGIN

@interface A : NSObject
//Property with 'retain (or strong)' attribute must be of object type
//Unknown type name 'B'

@property (nonatomic, strong) B *b;
@end

NS_ASSUME_NONNULL_END
