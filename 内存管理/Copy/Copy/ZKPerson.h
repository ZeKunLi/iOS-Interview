//
//  ZKPerson.h
//  Copy
//
//  Created by ZeKun Li on 2020/8/31.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKPerson : NSObject <NSCopying>
@property (nonatomic, copy) NSMutableArray *datas;
@property (nonatomic, strong) NSMutableSet <ZKPerson *>*friends;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int height;
@property (nonatomic, retain) NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (id)deepCopy;
@end

NS_ASSUME_NONNULL_END
