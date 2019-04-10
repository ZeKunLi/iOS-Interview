//
//  ViewController.m
//  UI事件传递Button指定位置响应
//
//  Created by 李泽昆 on 2019/4/10.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController () {
    CustomButton *button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    button = [[CustomButton alloc] initWithFrame:CGRectMake(100, 100, 120, 120)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)doAction:(id)sender{
    NSLog(@"click");
}


@end
