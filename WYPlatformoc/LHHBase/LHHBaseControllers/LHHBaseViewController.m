//
//  LHHBaseViewController.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseViewController.h"
#import "LHHCommonDefines.h"
#import "LHHCommonColors.h"
#import "LHHBarButtonItem.h"

@interface LHHBaseViewController ()

@end

@implementation LHHBaseViewController

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (IOS_VERSION >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    } else {
        self.wantsFullScreenLayout = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - LHHBarButtonItemDelegate
- (void)barBack {
    [self dismiss];
}

- (void)dealloc {
    NSLog(@"<%@>%@ %@", NSStringFromClass(self.class), self.title, NSStringFromSelector(_cmd));
}

@end
