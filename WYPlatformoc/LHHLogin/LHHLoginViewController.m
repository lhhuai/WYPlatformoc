//
//  LHHLoginViewController.m
//  LHHOCStudy
//
//  Created by seaphy on 16/3/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHLoginViewController.h"
#import "LHHDefines.h"
#import "LHHLoginTableViewCell.h"
#import "LHHMainViewController.h"

static NSString *kLHHLoginTableViewCellIdentifier = @"LHHLoginTableViewCellIdentifier";

@interface LHHLoginViewController () <UITableViewDelegate, UITableViewDataSource, LHHLoginTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSString *accountString;
@property (nonatomic, strong) NSString *passwordString;

@end

@implementation LHHLoginViewController

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // table view
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    // table header view
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 30, SCREEN_WIDTH - 80, 20)];
    titleLabel.text = @"Log In";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [tableHeaderView addSubview:titleLabel];
    self.tableView.tableHeaderView = tableHeaderView;
    
    // table footer view
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 30)];
    [loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(onLogin) forControlEvents:UIControlEventTouchUpInside];
    loginButton.backgroundColor = [UIColor greenColor];
    [tableFooterView addSubview:loginButton];

    self.tableView.tableFooterView = tableFooterView;
}

- (void)onLogin {
    LHHMainViewController *mvc = [[LHHMainViewController alloc] init];
    mvc.account = self.accountString;
    mvc.password = self.passwordString;
    [self.navigationController pushViewController:mvc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LHHLoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLHHLoginTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[LHHLoginTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLHHLoginTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.delegate = self;
    }
    if (indexPath.row == 0) {
        cell.cellType = LHHLoginCellTypeAccount;
        cell.label.text = @"Account";
        cell.textField.returnKeyType = UIReturnKeyNext;
        cell.textField.secureTextEntry = NO;
        cell.textField.placeholder = @"Enter account";
    }
    if (indexPath.row == 1) {
        cell.cellType = LHHLoginCellTypePassword;
        cell.label.text = @"Password";
        cell.textField.returnKeyType = UIReturnKeyDone;
        cell.textField.secureTextEntry = YES;
        cell.textField.placeholder = @"Enter password";
    }
    return cell;
}

#pragma mark - LHHLoginTableViewCellDelegate
- (void)cellTextFieldDidEndEditing:(LHHLoginTableViewCell *)cell {
    switch (cell.cellType) {
        case LHHLoginCellTypeAccount:
        {
            self.accountString = cell.textField.text;
            break;
        }
        case LHHLoginCellTypePassword:
        {
            self.passwordString = cell.textField.text;
        }
        default:
            break;
    }
}

@end
