//
//  LHHRegistTableViewCell.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/7.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HeightForRegistTableViewCell                      WY_SIZE(44)

@interface LHHRegistTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;

@end