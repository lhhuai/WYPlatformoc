//
//  LHHPercentBar.m
//  WYPlatformoc
//
//  Created by seaphy on 16/9/1.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHPercentBar.h"

@interface LHHPercentBar()

@property (nonatomic, assign) BOOL animated;
@property (nonatomic, assign) CFTimeInterval animationDuration;

@end

@implementation LHHPercentBar

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.animated = YES;
        self.animationDuration = .5;
        self.layer.cornerRadius = WY_SIZE(3.0);
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        _percentage = 0;
    }
    return self;
}

- (void)setPercentage:(CGFloat)percentage animated:(BOOL)animated {
    self.animated = animated;
    self.percentage = percentage;
    self.animated = YES;
}

- (void)setPercentage:(CGFloat)percentage {
    if (percentage == _percentage) return;
    if (percentage >= 100) percentage = 100;
    if (percentage <= 0) percentage = 0;
    
    [self progressBarTo:percentage];
    _percentage = percentage;
}

- (void)setForegroundColor:(UIColor *)foregroundColor {
    _foregroundColor = foregroundColor;
    self.layer.sublayers = nil;
    CGFloat temp = _percentage;
    [self setPercentage:0 animated:NO];
    [self setPercentage:temp animated:NO];
}

- (void)progressBarTo:(CGFloat)value {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat startY = self.frame.size.height * .5;
    CGFloat startX = self.frame.size.width * _percentage / 100;
    CGFloat endX = self.frame.size.width * value / 100;
    if (_percentage > value) {
        [path moveToPoint:CGPointMake(startX + 1, startY)];
        [path addLineToPoint:CGPointMake(endX + 1, startY)];
    } else {
        [path moveToPoint:CGPointMake(startX - 1, startY)];
        [path addLineToPoint:CGPointMake(endX, startY)];
    }
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = self.frame.size.height;
    layer.path = path.CGPath;
    layer.strokeColor = self.foregroundColor.CGColor;
    if (_percentage > value) layer.strokeColor = self.backgroundColor.CGColor;
    [self.layer addSublayer:layer];
    
    if (!self.animated) return;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = self.animationDuration;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.delegate = self;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}

- (void)reset {
    self.percentage = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.animationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.layer.sublayers = nil;
    });
}

@end
