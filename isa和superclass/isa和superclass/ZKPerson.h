//
//  ZKPerson.h
//  isa和superclass
//
//  Created by ZeKun Li on 2020/8/2.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKPerson : NSObject {
    @public
    int age;
}

@property (nonatomic, assign) int no;

+ (void)personClassMethond;
- (void)personInstanceMethond;

@end

NS_ASSUME_NONNULL_END
