//
//  UIView+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "UIView+WYAddition.h"

#import "NSObject+WYObjectAssociation.h"
#import "NSValue+WYBlock.h"

@interface WYTapGestureRecognizer : UITapGestureRecognizer

@property (nonatomic, copy) void(^tapHandler)();

@end

@implementation WYTapGestureRecognizer

- (id)initWithTapHandler:(void(^)())tapHandler
{
    self = [self initWithTarget:self action:@selector(_tapped:)];
    
    self.tapHandler = tapHandler;
    
    return self;
}

- (void)_tapped:(id)gr
{
    if (_tapHandler) {
        _tapHandler();
    }
}

@end

@implementation UIView (WYAddition)

- (UIImage *)wy_toImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [UIScreen mainScreen].scale);
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0f) {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    } else {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)wy_toImageLegacy {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [UIScreen mainScreen].scale);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)wy_fitToShowAllSubviews {
    CGFloat originalWidth = self.frame.size.width;
    
    CGFloat maxWidth = 0;
    CGFloat maxHeight = 0;
    for(UIView *view in [self subviews]){
        if (!view.hidden) {
            if(view.frame.origin.x + view.frame.size.width > maxWidth){
                maxWidth = view.frame.origin.x + view.frame.size.width;
            }
            if(view.frame.origin.y + view.frame.size.height > maxHeight){
                maxHeight = view.frame.origin.y + view.frame.size.height;
            }
        }
    }
    if (maxWidth != 0 && maxHeight != 0) {
        CGRect tmpRect = self.frame;
        tmpRect.size = CGSizeMake(maxWidth < originalWidth ? originalWidth : maxWidth, maxHeight);
        self.frame = tmpRect;
    }
}

- (void)wy_removeAllSubviews {
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
}

#pragma mark - line : top left bottom right
- (WYLineView *)wy_addTopLineWithColor:(UIColor *)color {
    WYLineView *line = [[WYLineView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
    line.color = color;
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:line];
    
    return line;
}

- (WYLineView *)wy_addLeftLineWithColor:(UIColor *)color {
    WYLineView *line = [[WYLineView alloc] initWithFrame:CGRectMake(0, 0, 1, self.frame.size.height)];
    line.color = color;
    line.vertical = YES;
    line.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self addSubview:line];
    
    return line;
}

- (WYLineView *)wy_addBottomLineWithColor:(UIColor *)color {
    CGFloat offsetY = 1.0f;
    if ([self isKindOfClass:[UITableViewCell class]] && [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) {
        offsetY = 0;
    }
    WYLineView *line = [[WYLineView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - offsetY, self.frame.size.width, 1)];
    line.color = color;
    line.alignment = WYLineViewAlignmentBottom;
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:line];
    
    return line;
}

- (WYLineView *)wy_addRightLineWithColor:(UIColor *)color {
    WYLineView *line = [[WYLineView alloc] initWithFrame:CGRectMake(self.frame.size.width - 1, 0, 1, self.frame.size.height)];
    line.color = color;
    line.vertical = YES;
    line.alignment = WYLineViewAlignmentBottom;
    line.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:line];
    
    return line;
}

#pragma mark - tapListener
- (void)wy_addTapListener:(void(^)())tapListener
{
    [self wy_addTapListener:tapListener identifier:nil];
}

- (void)wy_addTapListener:(void(^)())tapListener identifier:(NSString *)identifier
{
    NSMutableDictionary *keyIdentifierValueTapListener = [self wy_associatedObjectWithKey:@"wy_keyIdentifierValueTapListener"];
    if (keyIdentifierValueTapListener == nil) {
        keyIdentifierValueTapListener = [NSMutableDictionary dictionary];
        [self wy_setAssociatedObject:keyIdentifierValueTapListener key:@"wy_keyIdentifierValueTapListener"];
    }
    if (identifier == nil) {
        identifier = [NSString stringWithFormat:@"%f%ld", [NSDate timeIntervalSinceReferenceDate], (long)tapListener];
    }
    [keyIdentifierValueTapListener setObject:[NSValue wy_valueWithBlock:tapListener] forKey:identifier];
    
    if (self.userInteractionEnabled == NO) {
        self.userInteractionEnabled = YES;
    }
    
    WYTapGestureRecognizer *gr = [self wy_associatedObjectWithKey:@"wy_tap_gesture_recognizer"];
    if (gr == nil) {
        gr = [[WYTapGestureRecognizer alloc] initWithTapHandler:^{
            for (NSValue *blockValue in [keyIdentifierValueTapListener allValues]) {
                void(^tmpTapListener)() = [blockValue wy_block];
                tmpTapListener();
            }
        }];
        [self wy_setAssociatedObject:gr key:@"wy_tap_gesture_recognizer"];
        [self addGestureRecognizer:gr];
    }
}

- (void)wy_removeTapListenerWithIdentifier:(NSString *)identifier {
    NSMutableDictionary *keyIdentifierValueTapListener = [self wy_associatedObjectWithKey:@"wy_keyIdentifierValueTapListener"];
    [keyIdentifierValueTapListener removeObjectForKey:identifier];
}

#pragma mark - UIViewController
- (UIViewController *)wy_viewController {
    UIView *view = self;
    UIViewController *vc = (UIViewController *)view.nextResponder;
    
    while (vc != nil && ![vc isKindOfClass:[UIViewController class]]) {
        vc = (UIViewController *)vc.nextResponder;
    }
    
    return vc;
}
@end
