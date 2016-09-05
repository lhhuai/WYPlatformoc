//
//  LHHChatsViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHChatsViewController.h"
#import "LHHChatsSearchViewController.h"
#import "LHHSearchController.h"
#import "LHHChatsSearchResultsViewController.h"

#import "LHHChatsSession.h"
#import "LHHChatsContentCell.h"

@interface LHHChatsViewController () <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (nonatomic, strong) LHHSearchController *searchController;

@property (nonatomic, strong) LHHChatsSession *chatsSession;

@end

@implementation LHHChatsViewController

- (id)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setWYTitle:@"1"];
    
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    UINavigationController *searchResultsController = [[UINavigationController alloc] initWithRootViewController:[[LHHChatsSearchViewController alloc] init]];
    self.searchController = [[LHHSearchController alloc] initWithSearchResultsController:searchResultsController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
//    self.searchController.hidesBottomBarWhenPushed = YES;
//    self.searchController.view.backgroundColor = COLOR_MAIN_BG;
//    self.searchController.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//    self.searchController.dimsBackgroundDuringPresentation = NO;
//    self.searchController.obscuresBackgroundDuringPresentation = NO;
//    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,
                                                       self.searchController.searchBar.frame.origin.y,
                                                       self.searchController.searchBar.frame.size.width, PHONE_NAVIGATIONBAR_HEIGHT);
    // 关掉自动大写锁定
    self.searchController.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.searchController.searchBar.barTintColor = COLOR_MAIN_BG; // 设置后上下有黑线
    self.searchController.searchBar.tintColor = COLOR_WY_GREEN;
    self.searchController.searchBar.placeholder = @"Search";
    [self.searchController.searchBar setValue:@"Cancel" forKey:@"_cancelButtonText"];
    self.searchController.searchBar.delegate = self;
    // 去除黑线
    UIImageView *barImageView = [[[self.searchController.searchBar.subviews firstObject] subviews] firstObject];
    barImageView.layer.borderColor = COLOR_MAIN_BG.CGColor;
    barImageView.layer.borderWidth = WY_SIZE(1);
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    self.definesPresentationContext = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getChats];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (void)getChats {
    @weakify(self);
    [self checkNetWorkSuccessBlock:^{
        @strongify(self);
        if (!self.chatsSession) {
            self.chatsSession = [[LHHChatsSession alloc] init];
        }
        [self setWaiting:YES title:@"Loading..."];
        
        [self.chatsSession getChatsWithCondition:nil completeBlock:^(NSArray *chatsData) {
            @strongify(self);
            [self setWaiting:NO title:@"1"];
            self.dataArray = [chatsData mutableCopy];
            [self.tableView reloadData];
        } exceptionBlock:^{
            
        }];
    } errorBlock:^{
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *chatsDic = [self.dataArray objectAtIndex:indexPath.row];
    
    LHHChatsContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kLHHChatsContentCellIdentifier"];
    if (!cell) {
        cell = [[LHHChatsContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHChatsContentCellIdentifier"];
    }
    LHHChats *chats = [[LHHChats alloc] init];
    chats.chatsName = [chatsDic objectForKey:kChatsName];
    [cell updateCell:chats isLast:(self.dataArray.count == indexPath.row + 1)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"section=%ld, row=%ld", indexPath.section, indexPath.row);
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LHHChatsSearchResultsViewController *resultVC = [[LHHChatsSearchResultsViewController alloc] init];
    [self.navigationController pushViewController:resultVC animated:YES];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HeightForChatsContentCell;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = self.searchController.searchBar.text;

    [self.searchController hideBgView:![searchString isEqualToString:@""]];
    
    self.searchResults = [self.dataArray mutableCopy];
    if (self.searchController.searchResultsController) {
        UINavigationController *navController = (UINavigationController *)self.searchController.searchResultsController;
        LHHChatsSearchViewController *searchVC =  (LHHChatsSearchViewController *)navController.topViewController;
        searchVC.searchResults = self.searchResults;
        [searchVC reloadTable];
    }
}

#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)willDismissSearchController:(UISearchController *)searchController {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
}

@end
