//
//  ViewController.m
//  SafeObject(降低 App崩溃率)
//
//  Created by 李泽昆 on 2019/4/12.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewController.h"
//#import "NSArray+Safe.h"
#import "NSArray+Crash.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *arr = @[[NSNull null],@"",@""];
    NSLog(@"李%@",[arr objectAtIndex:6]);
    
//    NSLog(@"===%@",[arr safeObjectAtIndex:6]);
    

    
    
    
}


@end
