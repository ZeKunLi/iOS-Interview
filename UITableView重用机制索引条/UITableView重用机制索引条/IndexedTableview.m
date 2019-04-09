//
//  IndexedTableview.m
//  UITableView重用机制索引条
//
//  Created by 李泽昆 on 2019/4/9.
//  Copyright © 2019 personal. All rights reserved.
//

#define kButtonWidth 60

#import "IndexedTableview.h"
#import "ViewReusePool.h"
@interface IndexedTableview ()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) ViewReusePool *resuePool;


@end



@implementation IndexedTableview

- (void)reloadData {
    [super reloadData];
    
    // 懒加载
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor redColor];
        // 避免索引条跟着table滚动
        [self.superview insertSubview:_containerView aboveSubview:self];
    }
    
    if (_resuePool == nil) {
        _resuePool = [[ViewReusePool alloc] init];
    }
    
    // 标记所有试图为可重用的状态
    [_resuePool reset];
    // 移除当前显示的试图
    [self removeIndexBarSubView];
    // reload 字母索引条
    [self reloadIndexBar];
    
    
}

- (void)removeIndexBarSubView {
    for (UIView *view in self.containerView.subviews) {
        [view removeFromSuperview];
    }
}

- (void)reloadIndexBar {
    
    // 获取所有字母下标
    NSArray <NSString *> *titles = [NSArray array];
    if (self.indexDataSource && [self.indexDataSource respondsToSelector:@selector(indexTitlesForIndxIndxTable:)]) {
        titles = [self.indexDataSource indexTitlesForIndxIndxTable:self];
    }
    
    // 判断字母索引条师傅为空
    if (titles.count <= 0 || titles == nil) {
        [self.containerView setHidden:YES];
        return;
    }
    
    NSInteger count = titles.count;
    float buttonHeight = self.frame.size.height / count;
    UIButton *button;
    
    for (int i = 0; i < titles.count; i ++) {
        if ((button = (UIButton *)[_resuePool dequeueReuserableView])) {
            NSLog(@"从重用池取出button");
        } else {
            NSLog(@"从新创建了button");
            // 如果没有可重用的 button 重新创建一个
            button= [[UIButton alloc] init];
            // 注册到 button 可重用池当中
            [_resuePool addUsingView:button];
        }
        button.frame = CGRectMake(0, buttonHeight * i, kButtonWidth, buttonHeight);
        [button setTitle:titles[i] forState:(UIControlStateNormal)];
        
        // 添加 button 到父试图当中
        [self.containerView addSubview:button];
    }
    
    [_containerView setHidden:NO];
    
    
    
    
    
    _containerView.frame = CGRectMake(self.frame.size.width - kButtonWidth, self.frame.origin.y, kButtonWidth, self.frame.size.height);
}

@end
