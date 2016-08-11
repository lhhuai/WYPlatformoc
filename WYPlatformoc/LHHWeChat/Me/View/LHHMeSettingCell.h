//
//  LHHMeSettingCell.h
//  WYPlatformoc
//
//  Created by seaphy on 16/8/10.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHMeSettingCellModel.h"

#define HeightForMeSettingCell                       WeChat_CommonCell_Height
#define MarginLeftForMeSettingCell                   WeChat_Me_MarginLeft
#define MarginRightForMeSettingCell                  WeChat_Me_MarginRight

@interface LHHMeSettingCell : UITableViewCell

- (void)updateCell:(LHHMeSettingCellModel *)settingCellModel;

@end
