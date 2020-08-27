//
//  ViewController.m
//  定时器
//
//  Created by ZeKun Li on 2020/8/26.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"
#import "ZKWeakDelegate.h"
#import "ZKWeakProxy.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    self.link = [CADisplayLink displayLinkWithTarget:(中间对象) selector:@selector(displayTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    // 会产生循环引用 timer->Controller 导致 Controller 不会释放
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    // 解决方案1：
//    ZKWeakDelegate *weakDelegate = [[ZKWeakDelegate alloc] initWithTarget:self];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakDelegate selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    // 解决方案2：
    ZKWeakProxy *weakProxy = [[ZKWeakProxy alloc] initWithTarget:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakProxy selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    
    
    
    
}

- (void)timerTest {
    NSLog(@"%s",__func__);
}

- (void)displayTest {
    NSLog(@"%s",__func__);
}

-(void)dealloc {
    NSLog(@"%s",__func__);
    [self.timer invalidate];
}

@end
