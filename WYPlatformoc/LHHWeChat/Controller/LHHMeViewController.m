//
//  LHHMeViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeViewController.h"
#import "LHHMeCommonCell.h"

#define kSectionBlankHeight    @"SectionBlankHeight"
#define kImageName             @"ImageName"
#define kTitleName             @"TitleName"
#define kActionName            @"ActionName"

#define heightForCellRow       WY_SIZE(30)
#define marginLeft             WY_SIZE(10)
#define marginRight            WY_SIZE(10)

@interface LHHMeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHMeViewController

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
    
    self.dataArray = @[@[@{kSectionBlankHeight:@WY_SIZE(8)},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"My Posts", kActionName:@""},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Favorites", kActionName:@""},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Wallet", kActionName:@""},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Cards & Offers", kActionName:@""}],
                       
                       @[@{kSectionBlankHeight:@WY_SIZE(10)},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Sticker Gallery", kActionName:@""}],
  
                       @[@{kSectionBlankHeight:@WY_SIZE(10)},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Settings", kActionName:@""}]
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
    
    LHHMeCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kLHHIdentifier"];
    if (!cell) {
        cell = [[LHHMeCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 1) {
        UILabel *topLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WY_SIZE(.5))];
        topLine.backgroundColor = COLOR_SEPARATOR_LINE;
        [cell addSubview:topLine];
    }
    
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    [cell updateCellWithImageName:[dic objectForKey:kImageName] titleName:[dic objectForKey:kTitleName]];
    
    if (indexPath.row+1 == rows.count) {
        UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, heightForCellRow - WY_SIZE(.5), SCREEN_WIDTH, WY_SIZE(.5))];
        bottomLine.backgroundColor = COLOR_SEPARATOR_LINE;
        [cell addSubview:bottomLine];
    } else {
        UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(marginLeft, heightForCellRow - WY_SIZE(.5), SCREEN_WIDTH - marginLeft, WY_SIZE(.5))];
        bottomLine.backgroundColor = COLOR_SEPARATOR_LINE;
        [cell addSubview:bottomLine];
    }
    
    return cell;
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        NSNumber *heightNumber = [dic objectForKey:kSectionBlankHeight];
        return [heightNumber intValue];
    }
    return heightForCellRow;
}

@end
