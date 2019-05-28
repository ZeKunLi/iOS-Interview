//
//  ViewController.m
//  圆角离屏渲染
//
//  Created by 李泽昆 on 2019/5/28.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+RoundedCorners.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView0.center = self.view.center;
    [imageView0 setImage:[[UIImage imageNamed:@"131559051868_.pic.jpg"] circleImage]];
    [self.view addSubview:imageView0];
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView1.center = CGPointMake(200, 300); UIImage *anotherImage = [UIImage imageNamed:@"131559051868_.pic.jpg"]; UIGraphicsBeginImageContextWithOptions(imageView1.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView1.bounds
                                cornerRadius:50] addClip];
    [anotherImage drawInRect:imageView1.bounds];
    imageView1.image = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext();
    [self.view addSubview:imageView1];
    
    // 使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView2.image =[UIImage imageNamed:@"    "];
    UIGraphicsBeginImageContextWithOptions(imageView2.frame.size, NO, 1.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imageView2.bounds
                                                    cornerRadius:5];
    [path addClip];
    [imageView2 drawRect:imageView2.bounds];
    imageView2.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView2];
    
    
    //ios9之后UIButton设置圆角会触发离屏渲染，而UIImageView里png图片设置圆角不会触发离屏渲染了，如果设置其他阴影效果之类的还是会触发离屏渲染的
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 50;
    [button setImage:[UIImage imageNamed:@"131559051868_.pic.jpg"] forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    
}


@end
