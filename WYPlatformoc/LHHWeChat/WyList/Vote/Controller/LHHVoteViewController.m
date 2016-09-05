//
//  LHHVoteViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/30.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHVoteViewController.h"
#import "MJExtension.h"
#import "LHHVoteCell.h"
#import "LHHVoteView.h"
#import "UIView+WYLayout.h"

@interface LHHVoteViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LHHVoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect tableViewFrame = CGRectMake(0, 0, SCREEN_WIDTH, VIEW_HIDETABBAR_HEIGHT);
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self loadNewData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

- (void)loadNewData {
    [self setWaiting:YES title:@"Loading..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"vote" ofType:@"plist"];
        NSDictionary *votesDic = [NSDictionary dictionaryWithContentsOfFile:path];
        self.list = [LHHVoteModel mj_objectArrayWithKeyValuesArray:votesDic[@"data"][@"list"]];
        [self setWaiting:NO title:@"Vote"];
        [self.tableView reloadData];
    });
}

#pragma - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"row=%ld", indexPath.row+1);
    
    LHHVoteModel *voteModel = self.list[indexPath.row];
    
    LHHVoteCell *voteCell = [tableView dequeueReusableCellWithIdentifier:kLHHVoteCellIdentifier];
    if (!voteCell) {
        voteCell = [[LHHVoteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLHHVoteCellIdentifier];
    }
    
    voteCell.voteModel = voteModel;
    voteCell.row = indexPath.row+1;
    
    return voteCell;
}

#pragma - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return WY_SIZE(44 + 10);
    LHHVoteModel *voteModel = self.list[indexPath.row];
    return voteModel.voteCell_H;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.tableView.userInteractionEnabled = NO;
    [self refreshDataAtIndexPath:indexPath];
    
    LHHVoteCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        [selectedCell thumpUpStartAnimation];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.userInteractionEnabled = YES;
        });
        return;
    }
    
    LHHVoteModel *voteModel = self.list[indexPath.row];
    LHHVoteView *voteView = [[LHHVoteView alloc] initWithFrame:selectedCell.frame voteMedel:voteModel];
    voteView.layer.masksToBounds = NO;
    [self.tableView addSubview:voteView];
    self.tableView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:.4 animations:^{
        voteView.transform = CGAffineTransformMakeScale(1.05, 1.05);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.7 animations:^{
            [self.list removeObject:voteModel];
            [self.list insertObject:voteModel atIndex:0];
            [self.tableView moveRowAtIndexPath:indexPath toIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            voteView.centerX = selectedCell.centerX;
            voteView.centerY = selectedCell.centerY;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.4 animations:^{
                voteView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [voteView removeFromSuperview];
                self.tableView.userInteractionEnabled = YES;
            }];
        }];
    }];
}

#pragma mark - refresh data
- (void)refreshDataAtIndexPath:(NSIndexPath *)indexPath {
    LHHVoteModel *voteModel = self.list[indexPath.row];
    [self.list enumerateObjectsUsingBlock:^(LHHVoteModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (voteModel.isselected) {
            obj.isvote = NO;
            if (obj == voteModel) {
                obj.votes = @([obj.votes integerValue] - 40);
            }
            obj.totalVotes = @([obj.totalVotes integerValue] - 40);
        } else {
            if (obj.isselected) {
                obj.votes = @([obj.votes integerValue] - 40);
            }
            if (obj == voteModel) {
                obj.votes = @([obj.votes integerValue] + 40);
            }
            if (!obj.isvote) {
                obj.totalVotes = @([obj.totalVotes integerValue] + 40);
            }
            obj.isvote = YES;
        }
        if (voteModel != obj) {
            obj.isselected = NO;
        }
    }];
    
    voteModel.isselected = !voteModel.isselected;
    
    [self.tableView reloadData];
}

@end
