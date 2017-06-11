//
//  TabViewController.m
//  ObjcDemo
//
//  Created by lieon on 2017/6/11.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

#import "TabViewController.h"
#import "SimpleCell.h"

@interface TabViewController ()<UITableViewDataSource>

@property(nonatomic, strong) UITableView  * tableView;

@end

@implementation TabViewController

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView  = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        [_tableView registerClass:[SimpleCell class] forCellReuseIdentifier: @"cell"];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SimpleCell * cell = [tableView dequeueReusableCellWithIdentifier: @"cell" forIndexPath:indexPath];
    [cell configCell:@"bitch"];
    return  cell;
}
@end
