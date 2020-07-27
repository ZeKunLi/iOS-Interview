//
//  ViewController.m
//  Arithmetic(大厂算法)
//
//  Created by ZeKunLi on 2019/9/19.
//  Copyright © 2019 ZeKunLi. All rights reserved.
//

#import "ViewController.h"
#import "CommonSuperFind.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *indigoView;
@property (nonatomic, weak) IBOutlet UIView *orangeView;
@property (nonatomic, weak) IBOutlet UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *views = [[[CommonSuperFind alloc] init] findCommonSuperView:self.orangeView other:self.greenView];

    NSLog(@"共同父试图：%@",views);
    
    
}


@end
