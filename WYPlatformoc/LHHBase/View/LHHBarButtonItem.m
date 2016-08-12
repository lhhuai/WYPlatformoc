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

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target action:(SEL)action {
    return [LHHBarButtonItem backBarButtonItemWithTitle:nil target:target action:action];
}

+ (UIBarButtonItem *)backBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    if (!title) {
        title = @"Back";
    }
    UIFont *fpFont = WY_FONT_TITLE;
    CGSize fpSize = WY_TEXTSIZE(title, fpFont);
    
    UIControl *customView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, WY_IMAGE_SIZE(19) + WY_SIZE(4) + fpSize.width, WY_IMAGE_SIZE(19))];
    // back图标
    UIImageView *backIconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WY_IMAGE_SIZE(19), WY_IMAGE_SIZE(19))];
    backIconView.image = [UIImage imageNamed:@"navibar_back"];
    [customView addSubview:backIconView];
    // title
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(backIconView.frame) + WY_SIZE(4), 0, fpSize.width, WY_IMAGE_SIZE(19))];
    label.font = fpFont;
    label.textAlignment = NSTextAlignmentLeft;
    label.text = title;
    label.textColor = COLOR_WHITE;
    label.backgroundColor = [UIColor clearColor];
    [customView addSubview:label];
    
    if (action == nil) {
        action = @selector(barBack);
    }
    [customView addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:customView];
}

@end
