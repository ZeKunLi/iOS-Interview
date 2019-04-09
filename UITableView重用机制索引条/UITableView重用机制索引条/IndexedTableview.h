//
//  IndexedTableview.h
//  UITableView重用机制索引条
//
//  Created by 李泽昆 on 2019/4/9.
//  Copyright © 2019 personal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UITableViewIndexDataSource <NSObject>

- (NSArray<NSString *> *)indexTitlesForIndxIndxTable:(UITableView *)tableView;

@end

@interface IndexedTableview : UITableView
@property (nonatomic, weak) id <UITableViewIndexDataSource> indexDataSource;
@end

NS_ASSUME_NONNULL_END
