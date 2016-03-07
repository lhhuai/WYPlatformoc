//
//  LHHRegistViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/7.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRegistViewController.h"
#import "LHHBarButtonItem.h"
#import "LHHCommonDefines.h"
#import "LHHCommonColors.h"
#import "LHHRegistTableViewCell.h"
#import <MBProgressHUD.h>

@interface LHHRegistViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *signUpBtn;

@property (nonatomic, strong) NSString *accountString;
@property (nonatomic, strong) NSString *passwordString;
@property (nonatomic, strong) NSString *rePasswordString;

@end

@implementation LHHRegistViewController

- (void)loadView {
    [super loadView];
    self.navigationItem.leftBarButtonItem = [LHHBarButtonItem backBarButtonItemWith:self title:@"Cancel"];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    // table header view
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, SCREEN_WIDTH - 80, 20)];
    titleLabel.text = @"Sign Up";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [tableHeaderView addSubview:titleLabel];
    self.tableView.tableHeaderView = tableHeaderView;
    
    // table footer view
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT - 200)];
    // log in
    self.signUpBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH - 30, 30)];
    [self.signUpBtn setTitle:@"Submit" forState:UIControlStateNormal];
    self.signUpBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.signUpBtn addTarget:self action:@selector(onSignUp) forControlEvents:UIControlEventTouchUpInside];
    self.signUpBtn.layer.cornerRadius = 3;
    self.signUpBtn.layer.masksToBounds = YES;
    [self signUpButtonIsEnabled:NO];
    [tableFooterView addSubview:self.signUpBtn];
    self.tableView.tableFooterView = tableFooterView;
    
    NSString *moreString = @"Click \"Sign Up\" means you agree to Terms and Privacy";
    UIFont *moreFont = [UIFont systemFontOfSize:11];
    CGSize moreSize = WY_TEXTSIZE(moreString, moreFont);
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - moreSize.width * 2) / 2, VIEW_HIDETABBAR_HEIGHT - 30, moreSize.width * 2, 15)];
    moreLabel.text = moreString;
    moreLabel.textColor = RGBCOLOR(89, 91, 95);
    moreLabel.font = moreFont;
    moreLabel.userInteractionEnabled = YES;
    moreLabel.textAlignment = NSTextAlignmentCenter;
//    UITapGestureRecognizer *moreTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchUpInsideMoreLabel)];
//    [moreLabel addGestureRecognizer:moreTapGestureRecognizer];
    [self.view addSubview:moreLabel];
}

- (void)signUpButtonIsEnabled:(BOOL)isEnabled {
    if (isEnabled) {
        [self.signUpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.signUpBtn.backgroundColor = RGBCOLOR(7, 191, 5);
        self.signUpBtn.enabled = YES;
    } else {
        [self.signUpBtn setTitleColor:RGBCOLOR(166, 232, 166) forState:UIControlStateNormal];
        self.signUpBtn.backgroundColor = RGBCOLOR(106, 217, 104);
        self.signUpBtn.enabled = NO;
    }
}

- (void)onSignUp {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
- (void)textFieldTextDidChanged:(NSNotification *)notification {
    UITextField *textField = notification.object;
    switch (textField.tag) {
        case 0:
        {
            self.accountString = textField.text;
            break;
        }
        case 1:
        {
            self.passwordString = textField.text;
            break;
        }
        case 2:
        {
            self.rePasswordString = textField.text;
            break;
        }
        default:
            break;
    }
    
    [self signUpButtonIsEnabled:(self.accountString.length > 0 && self.passwordString.length > 0 && self.rePasswordString.length > 0)];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 2) {
        
    }
    
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kLHHRegistTableViewCellIdentifier = @"LHHRegistTableViewCellIdentifier";
    LHHRegistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLHHRegistTableViewCellIdentifier];
    if (cell == nil) {
        cell = [[LHHRegistTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLHHRegistTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    cell.textField.tag = indexPath.row;
    cell.textField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChanged:) name:UITextFieldTextDidChangeNotification object:cell.textField];
    if (indexPath.row == 0) {
        cell.label.text = @"Account";
        cell.textField.returnKeyType = UIReturnKeyNext;
        cell.textField.enablesReturnKeyAutomatically = YES;
        cell.textField.secureTextEntry = NO;
        cell.textField.placeholder = @"Enter account";
    }
    if (indexPath.row == 1) {
        cell.label.text = @"Password";
        cell.textField.returnKeyType = UIReturnKeyNext;
        cell.textField.enablesReturnKeyAutomatically = YES;
        cell.textField.secureTextEntry = YES;
        cell.textField.placeholder = @"Enter password";
    }
    if (indexPath.row == 2) {
        cell.label.text = @"RePassword";
        cell.textField.returnKeyType = UIReturnKeyDone;
        cell.textField.enablesReturnKeyAutomatically = YES;
        cell.textField.secureTextEntry = YES;
        cell.textField.placeholder = @"Enter rePassword";
    }
    return cell;
}

@end
