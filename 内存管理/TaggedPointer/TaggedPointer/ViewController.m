//
//  ViewController.m
//  TaggedPointer
//
//  Created by ZeKun Li on 2020/8/30.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *str1;
@property (nonatomic, strong) NSString *str2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSNumber *number1 = @1;
    NSNumber *number2 = @2;
    NSNumber *number3 = @3;
    NSNumber *number4 = @3;
    NSNumber *number5 = @(0xFFFFFFFFFFFFFFF);
    
    NSLog(@"number1 pointer is %p and class is %@",number1,[number1 class]);
    NSLog(@"number2 pointer is %p and class is %@",number2,[number2 class]);
    NSLog(@"number3 pointer is %p and class is %@",number3,[number3 class]);
    NSLog(@"number4 pointer is %p and class is %@",number4,[number4 class]);
    NSLog(@"number5 pointer is %p and class is %@",number5,[number5 class]);
    
    
    NSString *string1 = @"1";
    NSString *string2 = [NSString stringWithString:@"1"];
    NSString *string3 = [[NSString alloc] initWithString:@"2"];
    NSString *string4 = [NSString stringWithFormat:@"3"];
    NSString *string5 = [[NSString alloc] initWithFormat:@"3"];
    NSString *string6 = [[NSString alloc] initWithFormat:@"abcdefghijklmn"];
    NSString *string7 = [[NSString alloc] initWithFormat:@"3"];
    
    NSLog(@"string1 pointer is %p and class is %@",string1,[string1 class]);
    NSLog(@"string2 pointer is %p and class is %@",string2,[string2 class]);
    NSLog(@"string3 pointer is %p and class is %@",string3,[string3 class]);
    NSLog(@"string4 pointer is %p and class is %@",string4,[string4 class]);
    NSLog(@"string5 pointer is %p and class is %@",string5,[string5 class]);
    NSLog(@"string6 pointer is %p and class is %@",string6,[string6 class]);
    NSLog(@"string7 pointer is %p and class is %@",string7,[string7 class]);
    
    for (int i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // 永远不可能发生崩溃,NSTaggedPointerString
            self.str1 = [NSString stringWithFormat:@"123"];
        });
    }
    
    for (int i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // 栈区
            NSString *string1 = [[NSString alloc] initWithFormat:@"abcdefghijk"];
            // 常量区
            NSString *string2 = @"abcdefghijk";
        });
    }
    
    for (int i = 0; i < 1000; i++) {
        // 可能会发生奔溃,__NSCFString 类型，可以加锁
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.str2 = [[NSString alloc] initWithFormat:@"abcdefghijk"];
        });
    }
    
    

}


@end
