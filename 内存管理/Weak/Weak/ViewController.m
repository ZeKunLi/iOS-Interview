//
//  ViewController.m
//  Weak
//
//  Created by ZeKun Li on 2020/8/31.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"
#import "ZKPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __strong ZKPerson *strongPerson;
    __weak ZKPerson *weakPerson;
    __unsafe_unretained ZKPerson *unsafePerson;
    NSLog(@"=====================================");
    {
        ZKPerson *person = [[ZKPerson alloc] init];
        strongPerson = person;
        strongPerson.name = @"strongPerson";
    }
    NSLog(@"=====================================");
    {
        ZKPerson *person = [[ZKPerson alloc] init];
        weakPerson = person;
        weakPerson.name = @"weakPerson";
    }
    NSLog(@"=====================================");
    {
        ZKPerson *person = [[ZKPerson alloc] init];
        unsafePerson = person;
        unsafePerson.name = @"unsafePerson";
    }
    NSLog(@"=====================================");
    
    NSLog(@"%p",strongPerson);
    NSLog(@"%p",weakPerson);
    NSLog(@"%p",unsafePerson);
    
}


@end
