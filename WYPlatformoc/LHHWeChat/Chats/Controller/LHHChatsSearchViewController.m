//
//  LHHChatsSearchViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHChatsSearchViewController.h"
#import "LHHChatsSearchResultsViewController.h"
#import "UIImage+WYAddition.h"
#import "LHHChatsContentCell.h"

#define HeightForChatsSearch                      WY_SIZE(44)

@interface LHHChatsSearchViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHChatsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = COLOR_MAIN_BG;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [LHHBaseViewController customizeSearchBars];
//    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
//    [LHHBaseViewController customizeBars];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadTable {
    [self.tableView reloadData];
}

#pragma - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *chatsDic = [self.searchResults objectAtIndex:indexPath.row];
    
    LHHChatsContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kLHHChatsContentCellIdentifier"];
    if (!cell) {
        cell = [[LHHChatsContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHChatsContentCellIdentifier"];
    }
    LHHChats *chats = [[LHHChats alloc] init];
    chats.chatsName = @"abc";
    [cell updateCell:chats isLast:(self.searchResults.count == indexPath.row + 1)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LHHChatsSearchResultsViewController *resultVC = [[LHHChatsSearchResultsViewController alloc] init];
    [self.navigationController pushViewController:resultVC animated:YES];
}

@end
