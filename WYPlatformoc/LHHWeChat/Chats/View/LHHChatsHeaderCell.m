//
//  LHHChatsHeaderCell.m
//  WYPlatformoc
//
//  Created by seaphy on 16/8/15.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHChatsHeaderCell.h"
#import "UIImage+WYAddition.h"

@interface LHHChatsHeaderCell()

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation LHHChatsHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCell];
    }
    return self;
}

- (void)setupCell {
    self.backgroundColor = COLOR_MAIN_BG;
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, (HeightForChatsHeaderCell - WY_SIZE(28)) * .5, SCREEN_WIDTH, WY_SIZE(28))];
    self.searchBar.placeholder = @"Search";
//    self.searchBar.backgroundColor = [UIColor clearColor];
//    self.searchBar.layer.masksToBounds = YES;
//    self.searchBar.layer.cornerRadius = WY_SIZE(3);
//    self.searchBar.searchBarStyle = UISearchBarStyleProminent;
//    self.searchBar.barTintColor = COLOR_MAIN_BG;
    self.searchBar.backgroundImage = [UIImage wy_imageWithColor:COLOR_MAIN_BG size:CGSizeMake(SCREEN_WIDTH, WY_SIZE(28))];
    [self.contentView addSubview:self.searchBar];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, HeightForChatsHeaderCell - WY_SIZE(.5), SCREEN_WIDTH, WY_SIZE(.5))];
    line.backgroundColor = COLOR_SEPARATOR_LINE;
    [self.contentView addSubview:line];
}

- (void)updateCell:(id)delegate {
    self.searchBar.delegate = delegate;
}

@end
