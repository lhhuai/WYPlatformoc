//
//  LHHSpaceCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/29.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHSpaceCell.h"

@implementation LHHSpaceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = COLOR_MAIN_BG;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (UITableViewCell *)buildSpaceCell:(UITableView *)tableView {
    static NSString *cellIdentifier = @"K_LHH_SPACE_CELL";
    LHHSpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[LHHSpaceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.contentView.backgroundColor = COLOR_MAIN_BG;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
