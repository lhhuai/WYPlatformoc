//
//  LHHMeViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeViewController.h"

@interface LHHMeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setWYTitle:@"4"];

    self.view.backgroundColor = COLOR_MAIN_BG;
    
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    _tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    [self buildNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kLHHIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHIdentifier"];
        cell.backgroundColor = [UIColor grayColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@", (long)indexPath.row, @"content"];
    
    return cell;
}

@end
