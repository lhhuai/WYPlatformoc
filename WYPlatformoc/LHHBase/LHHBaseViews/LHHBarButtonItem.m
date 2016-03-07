//
//  LHHBarButtonItem.m
//  WYPlatformoc
//
//  Created by seaphy on 16/3/7.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHBarButtonItem.h"
#import "LHHCommonColors.h"

@implementation LHHBarButtonItem

+ (UIBarButtonItem *)backBarButtonItemWith:(id<LHHBarButtonItemDelegate>)delegate title:(NSString *)title {
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 18)];
    leftLabel.font = [UIFont systemFontOfSize:13];
    if (title) {
        leftLabel.text = title;
    } else {
        leftLabel.text = @"Back";
    }
    leftLabel.textColor = RGBCOLOR(0, 183, 0);
    leftLabel.backgroundColor = [UIColor clearColor];
    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 18)];
    [customView addSubview:leftLabel];
    if ([delegate respondsToSelector:@selector(barBack)]) {
        [customView addTarget:delegate action:@selector(barBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:customView];
}

@end
