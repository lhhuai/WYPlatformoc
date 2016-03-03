//
//  ViewController.m
//  LHHOCStudy
//
//  Created by seaphy on 16/2/25.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMainViewController.h"
#import "LHHDefines.h"

@interface LHHMainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHMainViewController

- (void)loadView {
    [super loadView];
    
//    self.navigationItem.title = @"Study OC";
    
    self.title = @"wenyuan";
    
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    _tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (IOS_VERSION >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    } else {
//        self.wantsFullScreenLayout = YES;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kLHHIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHIdentifier"];
        cell.backgroundColor = [UIColor grayColor];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = self.account;
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = self.password;
    }
    return cell;
}

@end
