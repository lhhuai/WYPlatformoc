//
//  LHHLoginViewController.m
//  LHHOCStudy
//
//  Created by seaphy on 16/3/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHLoginViewController.h"
#import "LHHCommonDefines.h"
#import "LHHCommonColors.h"
#import "LHHLoginTableViewCell.h"
#import "LHHMainViewController.h"
#import "LHHActionSheet.h"
#import "LHHRegistViewController.h"

static NSString *kLHHLoginTableViewCellIdentifier = @"LHHLoginTableViewCellIdentifier";

@interface LHHLoginViewController () <UITableViewDelegate, UITableViewDataSource, LHHLoginTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) NSString *accountString;
@property (nonatomic, strong) NSString *passwordString;

@end

@implementation LHHLoginViewController

- (void)loadView {
    [super loadView];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    UIImage *bgImage = [UIImage imageNamed:@"blank_Translucent_44"];
//    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTranslucent:YES];
//    self.navigationController.navigationBar.alpha = 0.5;
    NSArray *list = self.navigationController.navigationBar.subviews;
    for (id obj in list) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView = (UIImageView *)obj;
            NSArray *list2 = imageView.subviews;
            for (id obj2 in list2) {
                if ([obj2 isKindOfClass:[UIImageView class]]) {
                    UIImageView *imageView2 = (UIImageView *)obj2;
                    imageView2.hidden = YES;
                }
            }
        }
    }
    
    // table view
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    // table header view
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, SCREEN_WIDTH - 80, 20)];
    titleLabel.text = @"Log In";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [tableHeaderView addSubview:titleLabel];
    self.tableView.tableHeaderView = tableHeaderView;
    
    // table footer view
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT - 160)];
    // log in
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH - 30, 30)];
    [self.loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.loginButton addTarget:self action:@selector(onLogin) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.layer.cornerRadius = 3;
    self.loginButton.layer.masksToBounds = YES;
    [self loginButtonIsEnabled:NO];
    [tableFooterView addSubview:self.loginButton];
    // forgot password
    NSString *fpString = @"Forgot password?";
    UIFont *fpFont = [UIFont systemFontOfSize:11];
    CGSize fpSize = WY_TEXTSIZE(fpString, fpFont);
    UILabel *forgotPasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - fpSize.width) / 2, CGRectGetMaxY(self.loginButton.frame) + 15, fpSize.width, fpSize.height)];
    forgotPasswordLabel.text = fpString;
    forgotPasswordLabel.textColor = RGBCOLOR(94, 115, 156);
    forgotPasswordLabel.font = fpFont;
    [tableFooterView addSubview:forgotPasswordLabel];
    self.tableView.tableFooterView = tableFooterView;
    
    NSString *moreString = @"More";
    UIFont *moreFont = [UIFont systemFontOfSize:11];
    CGSize moreSize = WY_TEXTSIZE(moreString, moreFont);
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - moreSize.width * 2) / 2, VIEW_HIDETABBAR_HEIGHT - 30, moreSize.width * 2, 15)];
    moreLabel.text = moreString;
    moreLabel.textColor = RGBCOLOR(94, 115, 156);
    moreLabel.font = moreFont;
    moreLabel.userInteractionEnabled = YES;
    moreLabel.textAlignment = NSTextAlignmentCenter;
    UITapGestureRecognizer *moreTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchUpInsideMoreLabel)];
    [moreLabel addGestureRecognizer:moreTapGestureRecognizer];
    [self.view addSubview:moreLabel];
}

- (void)onLogin {
    self.loginButton.enabled = false;
    LHHMainViewController *mvc = [[LHHMainViewController alloc] init];
    mvc.account = self.accountString;
    mvc.password = self.passwordString;
    [self.navigationController pushViewController:mvc animated:YES];
}

- (void)didTouchUpInsideMoreLabel {
    LHHActionSheet *action = [[LHHActionSheet alloc] initWithCancelStr:@"Cancel" otherButtonTitles:@[@"Sign Up", @"Other"] attachTitle:nil];
    
//    [action ChangeTitleColor:[UIColor redColor] AndIndex:1];
    
//    @weakify(self);
//    __weak __typeof(&*self)weakSelf = self;
    [action buttonIndex:^(NSInteger buttonindex) {
//        @strongify(self);
        switch (buttonindex) {
            case 1:
            {
                LHHRegistViewController *registVC = [[LHHRegistViewController alloc] init];
                [self.navigationController pushViewController:registVC animated:YES];
                break;
            }
            default:
                break;
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginButtonIsEnabled:(BOOL)isEnabled {
    if (isEnabled) {
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.loginButton.backgroundColor = RGBCOLOR(7, 191, 5);
        self.loginButton.enabled = YES;
    } else {
        [self.loginButton setTitleColor:RGBCOLOR(166, 232, 166) forState:UIControlStateNormal];
        self.loginButton.backgroundColor = RGBCOLOR(106, 217, 104);
        self.loginButton.enabled = NO;
    }
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
        cell.textField.enablesReturnKeyAutomatically = YES;
        cell.textField.secureTextEntry = NO;
        cell.textField.placeholder = @"Enter account";
    }
    if (indexPath.row == 1) {
        cell.cellType = LHHLoginCellTypePassword;
        cell.label.text = @"Password";
        cell.textField.returnKeyType = UIReturnKeyDone;
        cell.textField.enablesReturnKeyAutomatically = YES;
        cell.textField.secureTextEntry = YES;
        cell.textField.placeholder = @"Enter password";
    }
    return cell;
}

#pragma mark - LHHLoginTableViewCellDelegate
- (void)cellTextFieldTextDidChanged:(LHHLoginTableViewCell *)cell {
    switch (cell.cellType) {
        case LHHLoginCellTypeAccount:
        {
            self.accountString = cell.textField.text;
            break;
        }
        case LHHLoginCellTypePassword:
        {
            self.passwordString = cell.textField.text;
            break;
        }
        default:
            break;
    }
    
    [self loginButtonIsEnabled:(self.accountString.length > 0 && self.passwordString.length > 0)];

}

//- (void)cellTextFieldDidEndEditing:(LHHLoginTableViewCell *)cell {
//    switch (cell.cellType) {
//        case LHHLoginCellTypeAccount:
//        {
//            self.accountString = cell.textField.text;
//            break;
//        }
//        case LHHLoginCellTypePassword:
//        {
//            self.passwordString = cell.textField.text;
//        }
//        default:
//            break;
//    }
//}

- (void)cellTextFieldShouldReturn:(LHHLoginTableViewCell *)cell {
    LHHLoginTableViewCell *nextCell = nil;
    switch (cell.cellType) {
        case LHHLoginCellTypeAccount:
        {
            nextCell = (LHHLoginTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
            break;
        }
        case LHHLoginCellTypePassword:
        {
            if (self.accountString.length > 0 && self.passwordString > 0) {
                [self onLogin];
            }
            
            break;
        }
        default:
            break;
    }
    if (nextCell) {
        [nextCell.textField becomeFirstResponder];
    }
}

@end
