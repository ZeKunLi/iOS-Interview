//
//  ViewController.m
//  MRC
//
//  Created by ZeKun Li on 2020/8/30.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"
#import "ZKPerson.h"
#import "ZKDog.h"

@interface ViewController ()
@property (nonatomic, retain) ZKPerson *person;

@property (nonatomic, retain) NSMutableArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person = [[ZKPerson alloc] init];
    self.person.name = @"name";
    
    
    ZKDog *dog = [[ZKDog alloc] init]; // dog 1
    
    [self.person setDog:dog]; // dog 2
    
    [dog release]; // dog 1
    
    NSLog(@"%@",self.person.name);
    
    
    NSMutableArray *datas = [NSMutableArray array];
    
    self.datas = datas;
    
    [datas release];
    
    
    
}

- (void)dealloc {
    self.datas = nil;
    [super dealloc];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%p",[self.person dog]);
}


@end
