//
//  LHHLoginTableViewCell.h
//  LHHOCStudy
//
//  Created by seaphy on 16/3/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LHHLoginCellType) {
    LHHLoginCellTypeAccount,
    LHHLoginCellTypePassword
};

@protocol LHHLoginTableViewCellDelegate;

@interface LHHLoginTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, assign) LHHLoginCellType cellType;

@property (nonatomic, weak) id<LHHLoginTableViewCellDelegate> delegate;

@end

@protocol LHHLoginTableViewCellDelegate <NSObject>

- (void)cellTextFieldDidEndEditing:(LHHLoginTableViewCell *)cell;

@end