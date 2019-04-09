//
//  UsageScenariosViewController.m
//  frame和bounds的区别
//
//  Created by 李泽昆 on 2019/4/9.
//  Copyright © 2019 personal. All rights reserved.
//

#import "UsageScenariosViewController.h"

@interface UsageScenariosViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation UsageScenariosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100,0, 50, 1150)];
    self.imageView.image = [UIImage imageNamed:@"github"];
    
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.delegate = self;
    [self.scrollView addSubview:self.imageView];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollview[contentoffset:%@\n---frame:%@\n------bounds:%@"
          ,NSStringFromCGPoint(scrollView.contentOffset)
          ,NSStringFromCGRect(self.scrollView.frame)
          ,NSStringFromCGRect(self.scrollView.bounds));
    NSLog(@"imageview[frame:%@\n------bounds:%@",NSStringFromCGRect(self.imageView.frame),NSStringFromCGRect(self.imageView.bounds));
}

@end
