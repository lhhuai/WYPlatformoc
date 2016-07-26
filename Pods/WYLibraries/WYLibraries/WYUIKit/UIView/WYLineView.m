//
//  WYLineView.m
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "WYLineView.h"
#import "UIImage+WYAddition.h"

typedef struct {
    BOOL vertical;
    BOOL normalBorder;
    CGSize viewSize;
} WYLineViewImageSetting;

@interface WYLineView()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) WYLineViewImageSetting imageSetting;

@end

@implementation WYLineView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self _init];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.color = self.backgroundColor;
    self.backgroundColor = [UIColor clearColor];
    [self _init];
}

- (void)_init {
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.imageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.imageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.alignment == WYLineViewAlignmentTop) {
        self.imageView.contentMode = UIViewContentModeTop;
    } else if (self.alignment == WYLineViewAlignmentCenter) {
        self.imageView.contentMode = UIViewContentModeCenter;
    } else if (self.alignment == WYLineViewAlignmentBottom) {
        self.imageView.contentMode = _vertical ? UIViewContentModeRight : UIViewContentModeBottom;
    }
    
    WYLineViewImageSetting setting;
    setting.vertical = _vertical;
    setting.normalBorder = _normalBorder;
    setting.viewSize = self.frame.size;
    
    if (setting.vertical != _imageSetting.vertical
        || setting.normalBorder != _imageSetting.normalBorder
        || setting.viewSize.width != _imageSetting.viewSize.width
        || setting.viewSize.height != _imageSetting.viewSize.height) {
        _imageSetting = setting;
        
        CGFloat lineWidth = _normalBorder ? 1.0f : ([UIScreen mainScreen].scale > 1.0f ? 0.50f : 1.0f);
        if (self.vertical) {
            self.imageView.image = [UIImage wy_imageWithColor:self.color size:CGSizeMake(lineWidth, self.frame.size.height)];
        } else {
            self.imageView.image = [UIImage wy_imageWithColor:self.color size:CGSizeMake(self.frame.size.width, lineWidth)];
        }
    }
}

- (void)setAlignment:(WYLineViewAlignment)alignment {
    _alignment = alignment;
    [self setNeedsLayout];
}

@end
