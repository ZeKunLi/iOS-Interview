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
#import "ZKThread.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) ZKThread *thread;

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
//    ZKWeakProxy *weakProxy = [[ZKWeakProxy alloc] initWithTarget:self];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakProxy selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    
    // 子线程使用 NSTimer
    __weak typeof(self) weakSelf = self;
    self.thread = [[ZKThread alloc] initWithBlock:^{
        ZKWeakProxy *weakProxy = [[ZKWeakProxy alloc] initWithTarget:weakSelf];
        weakSelf.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakProxy selector:@selector(timerTest) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:weakSelf.timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    [self.thread start];
    
    
}

- (void)timerTest {
    NSLog(@"%s - %@",__func__,[NSThread currentThread]);
}

- (void)displayTest {
    NSLog(@"%s",__func__);
}

-(void)dealloc {
    NSLog(@"%s",__func__);
    [self.timer invalidate];
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
}

// 用于停止子线程的RunLoop
- (void)stopThread {
    
    // 停止RunLoop
    CFRunLoopStop(CFRunLoopGetCurrent());
    // 清空线程
    self.thread = nil;
}

@end
