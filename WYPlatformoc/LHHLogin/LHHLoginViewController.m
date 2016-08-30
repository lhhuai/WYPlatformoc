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
#import "LHHLoginSession.h"
#import "MBProgressHUD.h"
#import "LHHUserPreferences.h"

static NSString *kLHHLoginTableViewCellIdentifier = @"LHHLoginTableViewCellIdentifier";

@interface LHHLoginViewController () <UITableViewDelegate, UITableViewDataSource, LHHLoginTableViewCellDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) NSString *accountString;
@property (nonatomic, strong) NSString *passwordString;

@property (nonatomic, strong) LHHLoginSession *loginSession;

@property (nonatomic, strong) MBProgressHUD *mbhud;

@end

@implementation LHHLoginViewController

- (id)init {
    self = [super init];
    if (self) {
        self.loginSession = [[LHHLoginSession alloc] init];
        self.gotoLoginType = LHHGotoLoginTypeOther;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
////    UIImage *bgImage = [UIImage imageNamed:@"blank_Translucent_44"];
////    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTranslucent:YES];
////    self.navigationController.navigationBar.alpha = 0.5;
//    NSArray *list = self.navigationController.navigationBar.subviews;
//    for (id obj in list) {
//        if ([obj isKindOfClass:[UIImageView class]]) {
//            UIImageView *imageView = (UIImageView *)obj;
//            NSArray *list2 = imageView.subviews;
//            for (id obj2 in list2) {
//                if ([obj2 isKindOfClass:[UIImageView class]]) {
//                    UIImageView *imageView2 = (UIImageView *)obj2;
//                    imageView2.hidden = YES;
//                }
//            }
//        }
//    }
    
    // table view
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    // table header view
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WY_SIZE(150))];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, WY_SIZE(150 - 50), SCREEN_WIDTH, WY_SIZE(25))];
    titleLabel.text = @"Log In";
    titleLabel.textColor = COLOR_TITLE;
    titleLabel.font = WY_FONT_SIZE_LARGE;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [tableHeaderView addSubview:titleLabel];
    self.tableView.tableHeaderView = tableHeaderView;
    
    
    // table footer view
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WY_SIZE(150))];
    // log in
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(WY_SIZE(21), WY_SIZE(20), SCREEN_WIDTH - WY_SIZE(21)*2, WY_SIZE(47))];
    [self.loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = WY_FONT_TITLE;
    [self.loginButton addTarget:self action:@selector(onLogin) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.layer.cornerRadius = WY_SIZE(3);
    self.loginButton.layer.masksToBounds = YES;
    [self loginButtonIsEnabled:NO];
    [tableFooterView addSubview:self.loginButton];
    // forgot password
    NSString *fpString = @"Forgot password?";
    UIFont *fpFont = WY_FONT_SECOND_TITLE;
    CGSize fpSize = WY_TEXTSIZE(fpString, fpFont);
    UILabel *forgotPasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - fpSize.width) / 2, CGRectGetMaxY(self.loginButton.frame) + WY_SIZE(23), fpSize.width, fpSize.height)];
    forgotPasswordLabel.text = fpString;
    forgotPasswordLabel.textColor = RGBCOLOR(94, 115, 156);
    forgotPasswordLabel.font = fpFont;
    [tableFooterView addSubview:forgotPasswordLabel];
    self.tableView.tableFooterView = tableFooterView;
    
    NSString *moreString = @"More";
    UIFont *moreFont = WY_FONT_SECOND_TITLE;
    CGSize moreSize = WY_TEXTSIZE(moreString, moreFont);
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - moreSize.width * 2) / 2, SCREEN_HEIGHT - WY_SIZE(25+15), moreSize.width * 2, WY_SIZE(15))];
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
    self.mbhud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    self.mbhud.labelText = @"Please wait...";
    self.mbhud.minSize = CGSizeMake(110.f, 110.f);
    self.mbhud.labelFont = [UIFont systemFontOfSize:11];
    self.mbhud.opacity = 0.5;
    self.mbhud.frame = CGRectMake(self.mbhud.frame.origin.x, self.mbhud.frame.origin.y, self.mbhud.frame.size.width, self.mbhud.frame.size.width);
    
    LHHUser *user = [[LHHUser alloc] init];
    user.account = self.accountString;
    user.password = self.passwordString;
    
    @weakify(self);
    [self.loginSession loginWithUser:user completeBlock:^{
        @strongify(self);
        UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        self.mbhud.customView = imageView;
        self.mbhud.mode = MBProgressHUDModeCustomView;
        self.mbhud.labelText = @"success.";
        [self.mbhud hide:YES afterDelay:2];
        [[LHHUserPreferences sharedInstance] archiveUser:user];
        [[LHHUserPreferences sharedInstance] saveIsLogin:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @strongify(self);
            switch (self.gotoLoginType) {
                case LHHGotoLoginTypeWeChat:
                {
                    [[NSNotificationCenter defaultCenter] postNotificationName:kLHHGotoWechatViewController object:nil];
                    break;
                }
                case LHHGotoLoginTypeOther:
                {
                    [self back];
                    break;
                }
            }
        });
        
    } exceptionBlock:^{
        @strongify(self);
        self.loginButton.enabled = true;
        UIImage *image = [[UIImage imageNamed:@"hud_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        self.mbhud.customView = imageView;
        self.mbhud.mode = MBProgressHUDModeCustomView;
        self.mbhud.labelText = @"account or password error.";
        [self.mbhud hide:YES afterDelay:2];
    }];
    
}

/// 登录后返回
- (void)back {
    [self dismissViewControllerAnimated:YES completion:^{
        //如果 dissmiss 前 登录成功，则执行 self.completeBlock, 取消登录则不执行 complete
        if (self.completeBlock && [LHHUserPreferences sharedInstance].isLogin) {
            self.completeBlock();
        }
    }];
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
                [self pushViewController:registVC];
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
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
    return HeightForLoginTableViewCell;
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
        cell.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
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
