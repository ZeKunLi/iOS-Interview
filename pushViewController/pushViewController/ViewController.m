//
//  ViewController.m
//  pushViewController
//
//  Created by ZeKun Li on 2020/8/20.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"V1 viewDidLoad");
}


- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"V1 viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"V1 viewDidAppear");
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"v1 viewDidDisappear");
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"V1 viewWillDisappear");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *vc = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"****************push******************");
}

@end
