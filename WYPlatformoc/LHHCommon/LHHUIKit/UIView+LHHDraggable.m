//
//  UIView+LHHDraggable.m
//  WYPlatformoc
//
//  Created by seaphy on 16/9/5.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "UIView+LHHDraggable.h"

@implementation UIView (LHHDraggable)

- (void)makeDraggable {
    NSAssert(self.superview, @"Super view is required when make view draggable");
    
    [self makeDraggableInView:self.superview damping:0.4];
}

- (void)makeDraggableInView:(UIView *)view damping:(CGFloat)damping {
    if (!view) return;
    [self removeDraggable];
    
    self.wy_playground = view;
    self.wy_damping = damping;
    
    [self wy_creatAnimator];
    [self wy_addPanGesture];
}

- (void)removeDraggable {
    [self removeGestureRecognizer:self.wy_panGesture];
    self.wy_panGesture = nil;
    self.wy_playground = nil;
    self.wy_animator = nil;
    self.wy_snapBehavior = nil;
    self.wy_attachmentBehavior = nil;
    self.wy_centerPoint = CGPointZero;
}

- (void)updateSnapPoint {
    self.wy_centerPoint = [self convertPoint:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) toView:self.wy_playground];
    self.wy_snapBehavior = [[UISnapBehavior alloc] initWithItem:self snapToPoint:self.wy_centerPoint];
    self.wy_snapBehavior.damping = self.wy_damping;
}

- (void)wy_creatAnimator {
    self.wy_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.wy_playground];
    [self updateSnapPoint];
}

- (void)wy_addPanGesture {
    self.wy_panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(wy_panGesture:)];
    [self addGestureRecognizer:self.wy_panGesture];
}

#pragma mark - Gesture

- (void)wy_panGesture:(UIPanGestureRecognizer *)pan {
    CGPoint panLocation = [pan locationInView:self.wy_playground];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        UIOffset offset = UIOffsetMake(panLocation.x - self.wy_centerPoint.x, panLocation.y - self.wy_centerPoint.y);
        [self.wy_animator removeAllBehaviors];
        self.wy_attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self
                                                               offsetFromCenter:offset
                                                               attachedToAnchor:panLocation];
        [self.wy_animator addBehavior:self.wy_attachmentBehavior];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        [self.wy_attachmentBehavior setAnchorPoint:panLocation];
    } else if (pan.state == UIGestureRecognizerStateEnded ||
               pan.state == UIGestureRecognizerStateCancelled ||
               pan.state == UIGestureRecognizerStateFailed) {
        [self.wy_animator removeAllBehaviors];
        [self.wy_animator addBehavior:self.wy_snapBehavior];
    }
}

#pragma mark - Associated Object

- (void)setWy_playground:(id)object {
    objc_setAssociatedObject(self, @selector(wy_playground), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)wy_playground {
    return objc_getAssociatedObject(self, @selector(wy_playground));
}

- (void)setWy_animator:(id)object {
    objc_setAssociatedObject(self, @selector(wy_animator), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIDynamicAnimator *)wy_animator {
    return objc_getAssociatedObject(self, @selector(wy_animator));
}

- (void)setWy_snapBehavior:(id)object {
    objc_setAssociatedObject(self, @selector(wy_snapBehavior), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UISnapBehavior *)wy_snapBehavior {
    return objc_getAssociatedObject(self, @selector(wy_snapBehavior));
}

- (void)setWy_attachmentBehavior:(id)object {
    objc_setAssociatedObject(self, @selector(wy_attachmentBehavior), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIAttachmentBehavior *)wy_attachmentBehavior {
    return objc_getAssociatedObject(self, @selector(wy_attachmentBehavior));
}

- (void)setWy_panGesture:(id)object {
    objc_setAssociatedObject(self, @selector(wy_panGesture), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIPanGestureRecognizer *)wy_panGesture {
    return objc_getAssociatedObject(self, @selector(wy_panGesture));
}

- (void)setWy_centerPoint:(CGPoint)point {
    objc_setAssociatedObject(self, @selector(wy_centerPoint), [NSValue valueWithCGPoint:point], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGPoint)wy_centerPoint {
    return [objc_getAssociatedObject(self, @selector(wy_centerPoint)) CGPointValue];
}

- (void)setWy_damping:(CGFloat)damping {
    objc_setAssociatedObject(self, @selector(wy_damping), @(damping), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)wy_damping {
    return [objc_getAssociatedObject(self, @selector(wy_damping)) floatValue];
}

@end
