//
//  LHHMeSettingViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/10.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHMeSettingViewController.h"
#import "LHHMeSettingCell.h"

#define kSectionBlankHeight              @"SectionBlankHeight"
#define kCellType                        @"CellType"
#define kTitleName                       @"TitleName"
#define kClassName                       @"ClassName"

@interface LHHMeSettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHMeSettingViewController

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
    [self setWYTitle:@"Settings"];
    
    self.dataArray = @[@[@{kSectionBlankHeight:@WY_SIZE(15)},
                         @{kTitleName:@"My Account", kClassName:@"", kCellType:@"Protected"}],
                       
                       @[@{kSectionBlankHeight:@WY_SIZE(22)},
                         @{kTitleName:@"Notifications", kClassName:@"", kCellType:@"Common"},
                         @{kTitleName:@"Privacy", kClassName:@"", kCellType:@"Common"},
                         @{kTitleName:@"General", kClassName:@"", kCellType:@"Common"}],
                       
                       @[@{kSectionBlankHeight:@WY_SIZE(22)},
                         @{kTitleName:@"Help & Feedback", kClassName:@"", kCellType:@"Common"},
                         @{kTitleName:@"About", kClassName:@"", kCellType:@"Common"}],
                       
                       @[@{kSectionBlankHeight:@WY_SIZE(22)},
                         @{kTitleName:@"Log Out", kClassName:@"", kCellType:@"Button"}]
                       ];
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

- (void)remoteNotificationDictionary:(NSDictionary *)dict {
    // 根据字典字段反射出我们想要的类，并初始化控制器
    Class class = NSClassFromString(dict[@"kClassName"]);
    UIViewController *vc = [[class alloc] init];
    //    // 获取参数列表，使用枚举的方式，对控制器进行KVC赋值
    //    NSDictionary *parameter = dict[@"propertys"];
    //    [parameter enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
    //        if ([[parameter allKeys] containsObject:key]) {
    //            [vc setValue:obj forKey:key];
    //        }
    //    }];
    [self.navigationController pushViewController:vc animated:YES];
    //    // 从字典中获取方法名，并调用对应的方法
    //    SEL selector = NSSelectorFromString(dict[@"method"]);
    //    [vc performSelector:selector];
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
//    if (indexPath.row == 0) {
        return [self setupSpaceCell:tableView];
//    }
//    
//    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
//    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
//    
//    if ([[dic objectForKey:kCellType] isEqualToString:@"Header"]) {
//        LHHMeHeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:@"kLHHMeHeaderCellIdentifier"];
//        if (!headerCell) {
//            headerCell = [[LHHMeHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHMeHeaderCellIdentifier"];
//            headerCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        }
//        LHHWeChatUser *user = [[LHHWeChatUser alloc] init];
//        user.profilePhoto = [dic objectForKey:kImageName];
//        user.name = [LHHUserPreferences sharedInstance].user.account;
//        user.weChatID = @"seaphyliu";
//        [headerCell updateCell:user];
//        return headerCell;
//    } else {
//        LHHMeCommonCell *commonCell = [tableView dequeueReusableCellWithIdentifier:@"kLHHMeCommonCellIdentifier"];
//        if (!commonCell) {
//            commonCell = [[LHHMeCommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"kLHHMeCommonCellIdentifier"];
//            commonCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        }
//        
//        if (indexPath.row == 1) {
//            UILabel *topLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, WY_SIZE(.5))];
//            topLine.backgroundColor = COLOR_SEPARATOR_LINE;
//            [commonCell addSubview:topLine];
//        }
//        [commonCell updateCellWithImageName:[dic objectForKey:kImageName] titleName:[dic objectForKey:kTitleName]];
//        
//        if (indexPath.row+1 == rows.count) {
//            UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, HeightForMeCommonCell - WY_SIZE(.5), SCREEN_WIDTH, WY_SIZE(.5))];
//            bottomLine.backgroundColor = COLOR_SEPARATOR_LINE;
//            [commonCell addSubview:bottomLine];
//        } else {
//            UILabel *bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(WeChat_Me_MarginLeft, HeightForMeCommonCell - WY_SIZE(.5), SCREEN_WIDTH - WeChat_Me_MarginLeft, WY_SIZE(.5))];
//            bottomLine.backgroundColor = COLOR_SEPARATOR_LINE;
//            [commonCell addSubview:bottomLine];
//        }
//        
//        return commonCell;
//    }
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *rows = [self.dataArray objectAtIndex:indexPath.section];
    NSDictionary *dic = [rows objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        NSNumber *heightNumber = [dic objectForKey:kSectionBlankHeight];
        return [heightNumber intValue];
    }
    return HeightForMeSettingCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"section=%ld, row=%ld", indexPath.section, indexPath.row);
    
}

@end
