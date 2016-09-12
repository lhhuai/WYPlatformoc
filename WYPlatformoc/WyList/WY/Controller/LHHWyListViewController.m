//
//  LHHWyListViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/29.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHWyListViewController.h"
#import "LHHMeCommonCell.h"
#import "LHHSpaceCell.h"

#define kSectionBlankHeight                   @"SectionBlankHeight"
#define kCellType                             @"CellType"
#define kImageName                            @"ImageName"
#define kTitleName                            @"TitleName"
#define kClassName                            @"ClassName"
#define kCellSelectionStyle                   @"CellSelectionStyle"

@interface LHHWyListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHWyListViewController

- (void)loadView {
    [super loadView];
    
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = @[@[@{kSectionBlankHeight:@WY_SIZE(22), kCellSelectionStyle:@"None"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Vote", kClassName:@"LHHVoteViewController", kCellType:@"Common", kCellSelectionStyle:@"Default"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"Number", kClassName:@"LHHWyNumberViewController", kCellType:@"Common", kCellSelectionStyle:@"Default"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"RacMvvm", kClassName:@"LHHRacMvvmViewController", kCellType:@"Common", kCellSelectionStyle:@"Default"}],
                       
                       @[@{kSectionBlankHeight:@WY_SIZE(22), kCellSelectionStyle:@"None"},
                         @{kImageName:@"wechat_me_setting", kTitleName:@"test", kClassName:@"", kCellType:@"Common", kCellSelectionStyle:@"Default"}]
                       ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        return [LHHSpaceCell buildSpaceCell:tableView];
    }
    
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    
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

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        NSNumber *heightNumber = [dic objectForKey:kSectionBlankHeight];
        return [heightNumber intValue];
    }
    return HeightForMeCommonCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    if ([NSClassFromString([dic objectForKey:kClassName]) isSubclassOfClass:[UIViewController class]]) {
        [self pushViewControllerWith:[dic objectForKey:kClassName] leftTitle:@"WyList" navTitle:[dic objectForKey:kTitleName]];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
