//
//  SecondViewController.m
//  pushViewController
//
//  Created by ZeKun Li on 2020/8/20.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"V2 viewDidLoad");
}


- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"V2 viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"V2 viewDidAppear");
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"v2 viewDidDisappear");
}

- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"V2 viewWillDisappear");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"****************pop******************");
}

@end
