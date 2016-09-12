//
//  LHHPercentBar.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHHPercentBar : UIView

@property (nonatomic, assign) CGFloat percentage;
@property (nonatomic, strong) UIColor *foregroundColor;

- (void)reset;

@end
