//
//  ViewController.m
//  UITableView重用机制索引条
//
//  Created by 李泽昆 on 2019/4/9.
//  Copyright © 2019 personal. All rights reserved.
//

#import "ViewController.h"
#import "IndexedTableview.h"
@interface ViewController () <UITableViewIndexDataSource>
@property (nonatomic, strong) IndexedTableview *tableView;
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.button];
    
}

#pragma mark - Response method

- (void)reloadData {
    [self.tableView reloadData];
}


#pragma mark - UITableViewIndexDataSoure
- (NSArray<NSString *> *)indexTitlesForIndxIndxTable:(UITableView *)tableView {
    static BOOL change = NO;
    if (change) {
        change = NO;
        return @[@"A",@"B",@"C",@"D",@"E"];
    } else {
        change = YES;
        return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H"];
    }
}

#pragma mark - Lazy loading
- (IndexedTableview *)tableView {
    if (!_tableView) {
        _tableView = [[IndexedTableview alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100)];
        _tableView.indexDataSource = self;
    }
    return _tableView;
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        _button.backgroundColor= [UIColor redColor];
//        _button.reversesTitleShadowWhenHighlighted = YES;
        [_button addTarget:self action:@selector(reloadData) forControlEvents:(UIControlEventTouchUpInside)];
        [_button setTitle:@"ReloadData" forState:(UIControlStateNormal)];
    }
    return _button;
}



@end
