//
//  LHHChatsSearchViewController.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBaseViewController.h"

@interface LHHChatsSearchViewController : LHHBaseViewController

@property (nonatomic, strong) NSMutableArray *searchResults;

- (void)reloadTable;

@end
