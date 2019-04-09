//
//  ViewController.m
//  frame和bounds的区别
//
//  Created by 李泽昆 on 2019/4/9.
//  Copyright © 2019 personal. All rights reserved.
//

//frame: 该view在父view坐标系统中的位置和大小。（参照点是，父亲的坐标系统）
//bounds：该view在本地坐标系统中的位置和大小。（参照点是，本地坐标系统，就相当于ViewB自己的坐标系统，以0,0点为起点）。

// 参考地址:https://www.jianshu.com/p/964313cfbdaa

#import "ViewController.h"
#import "UsageScenariosViewController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view1.backgroundColor = [UIColor redColor];
//    [view1 setBounds:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:view1];//添加到self.view
    NSLog(@"view1 frame:%@========view1 bounds:%@",NSStringFromCGRect(view1.frame),NSStringFromCGRect(view1.bounds));
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view2.backgroundColor = [UIColor yellowColor];
    [view1 addSubview:view2];//添加到view1上,[此时view1坐标系左上角起点为(-20,-20)]
    NSLog(@"view2 frame:%@========view2 bounds:%@",NSStringFromCGRect(view2.frame),NSStringFromCGRect(view2.bounds));
    
    [UIView animateWithDuration:3.0 animations:^{
        [view1 setBounds:CGRectMake(0, 1000, 200, 200)];
    }];
    
    NSLog(@"view1 frame:%@========view1 bounds:%@",NSStringFromCGRect(view1.frame),NSStringFromCGRect(view1.bounds));
    NSLog(@"view2 frame:%@========view2 bounds:%@",NSStringFromCGRect(view2.frame),NSStringFromCGRect(view2.bounds));
    
    
    /**
    分析
    上面设置view1的bounds的代码起到了让view2的位置改变的作用。为何（-20，-20）的偏移量，却可以让view2向右下角移动呢？
    这是因为setBounds的作用是：强制将自己（view1）本地坐标系的原点改为（-20，-20）。这个（-20，-20）是相对view1的父view（self.view）偏移的。也就是向左上角偏移。
    那么在view1的坐标系中（0，0）这个点是需要向右下各偏移20。
    因为view1的subview（view2）的frame参照的坐标系是父view（view1）的bounds设置的，而此时view2的frame设置为（0，0），就会导致view2向右下各偏移20。如上图所示。
    总结
    所以，bounds的有这么一个特点：
    它是参考自己坐标系，它可以修改自己坐标系的原点位置，进而影响到“子view”的显示位置。
    */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UsageScenariosViewController *usageVC = [[UsageScenariosViewController alloc] init];
    [self.navigationController pushViewController:usageVC animated:YES];
}


@end
