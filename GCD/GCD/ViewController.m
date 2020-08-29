//
//  ViewController.m
//  GCD
//
//  Created by 李泽昆 on 2019/4/26.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewController.h"
#import "SemaphoreObject.h"
#import "Timer/TimerObject.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, strong) NSMutableString *string;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 死锁问题
    // 主队列造成的循环等待
    dispatch_async(dispatch_get_main_queue(), ^{
        [self doSomeing];
    });
    
    // 创建串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", NULL);
    
    // 创建并行队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
//    dispatch_get_global_queue(0, 0)
    
    
    dispatch_sync(serialQueue, ^{
        [self doSomeing];
    });
    
    printf("%d", 222);
    SemaphoreObject *semaphore = [[SemaphoreObject alloc] init];
    for (int i = 0; i < 1500; i ++) {
        
        [[[NSThread alloc] initWithBlock:^{
            [semaphore downloadTVPlay];
        }] start];
    }
    
    
    self.string = [NSMutableString string];
    
    [TimerObject timerTarget:self selector:@selector(updateTextView) after:0 key:TimerGlobalKeyA];
    
    [TimerObject timerTask:^{
        static int count;
        self.label.text = [NSString stringWithFormat:@"%d",count ++];
    } interval:1 after:1 key:TimerGlobalKeyB];
    

}

- (void)updateTextView {
    [self.string appendFormat:@"%@\n", [NSString stringWithFormat:@"%@",[NSThread currentThread]]];
    self.textView.text = self.string.copy;
    [self.textView scrollRangeToVisible:NSMakeRange(self.textView.text.length, 1)];
}

- (void)doSomeing {
    for (int i = 0; i <= 10000; i++) {
        printf("%d", 100);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (int i = 0; i < 150; i++) {
        dispatch_async(dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT), ^{
            [TimerObject cancelTimerWithkey:TimerGlobalKeyB];
        });
    }
    
}


@end
