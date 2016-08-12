//
//  LHHMeViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeViewController.h"
#import "LHHMeHeaderCell.h"
#import "LHHMeCommonCell.h"
#import "LHHUserPreferences.h"

#define kSectionBlankHeight                   @"SectionBlankHeight"
#define kCellType                             @"CellType"
#define kImageName                            @"ImageName"
#define kTitleName                            @"TitleName"
#define kClassName                            @"ClassName"
#define kCellSelectionStyle                   @"CellSelectionStyle"

@interface LHHMeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHMeViewController

- (id)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = COLOR_MAIN_BG;
    
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setWYTitle:@"4"];
    
    self.dataArray = @[@[@{kSectionBlankHeight:@WY_SIZE(15), kCellSelectionStyle:@"None"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Header", kClassName:@"", kCellType:@"Header", kCellSelectionStyle:@"Default"}],
                       
                       @[@{kSectionBlankHeight:@WY_SIZE(22), kCellSelectionStyle:@"None"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"My Posts", kClassName:@"", kCellType:@"Common", kCellSelectionStyle:@"Default"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Favorites", kClassName:@"", kCellType:@"Common", kCellSelectionStyle:@"Default"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Wallet", kClassName:@"", kCellType:@"Common", kCellSelectionStyle:@"Default"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Cards & Offers", kClassName:@"", kCellType:@"Common", kCellSelectionStyle:@"Default"}],
                       
                       @[@{kSectionBlankHeight:@WY_SIZE(22), kCellSelectionStyle:@"None"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Sticker Gallery", kClassName:@"", kCellType:@"Common", kCellSelectionStyle:@"Default"}],
  
                       @[@{kSectionBlankHeight:@WY_SIZE(22), kCellSelectionStyle:@"None"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Settings", kClassName:@"LHHMeSettingViewController", kCellType:@"Common", kCellSelectionStyle:@"Default"}]
                       ];
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

- (UITableViewCell *)setupSpaceCell:(UITableView *)tableView{
    static NSString *cellIdentifier = @"K_LHH_ME_SPACE_CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.contentView.backgroundColor = COLOR_MAIN_BG;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = [self.dataArray objectAtIndex:section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [self setupSpaceCell:tableView];
    }
    
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    
    if ([[dic objectForKey:kCellType] isEqualToString:@"Header"]) {
        LHHMeHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"kLHHMeHeaderCellIdentifier"];
        if (!headerCell) {
            headerCell = [[LHHMeHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHMeHeaderCellIdentifier"];
        }
        LHHWeChatUser *user = [[LHHWeChatUser alloc] init];
        user.profilePhoto = [dic objectForKey:kImageName];
        user.name = [LHHUserPreferences sharedInstance].user.account;
        user.weChatID = [NSString stringWithFormat:@"%@Id", [LHHUserPreferences sharedInstance].user.account];
        [headerCell updateCell:user];
        return headerCell;
    } else {
        LHHMeCommonCell *commonCell = [tableView dequeueReusableCellWithIdentifier:@"kLHHMeCommonCellIdentifier"];
        if (!commonCell) {
            commonCell = [[LHHMeCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHMeCommonCellIdentifier"];
        }
        
        if (indexPath.row == 1) {
            UILabel *topLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WY_SIZE(.5))];
            topLine.backgroundColor = COLOR_SEPARATOR_LINE;
            [commonCell addSubview:topLine];
        }
        [commonCell updateCellWithImageName:[dic objectForKey:kImageName] titleName:[dic objectForKey:kTitleName]];
        
        if (indexPath.row+1 == rows.count) {
            UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, HeightForMeCommonCell - WY_SIZE(.5), SCREEN_WIDTH, WY_SIZE(.5))];
            bottomLine.backgroundColor = COLOR_SEPARATOR_LINE;
            [commonCell addSubview:bottomLine];
        } else {
            UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(WeChat_Me_MarginLeft, HeightForMeCommonCell - WY_SIZE(.5), SCREEN_WIDTH - WeChat_Me_MarginLeft, WY_SIZE(.5))];
            bottomLine.backgroundColor = COLOR_SEPARATOR_LINE;
            [commonCell addSubview:bottomLine];
        }
        
        return commonCell;
    }
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        NSNumber *heightNumber = [dic objectForKey:kSectionBlankHeight];
        return [heightNumber intValue];
    }
    if ([[dic objectForKey:kCellType] isEqualToString:@"Header"]) {
        return HeightForMeHeaderCell;
    } else {
        return HeightForMeCommonCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    if ([NSClassFromString([dic objectForKey:kClassName]) isSubclassOfClass:[UIViewController class]]) {
        [self pushViewControllerWith:[dic objectForKey:kClassName] leftTitle:@"Me"];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
