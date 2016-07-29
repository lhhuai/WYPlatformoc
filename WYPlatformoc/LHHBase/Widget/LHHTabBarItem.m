//
//  LHHTabBarItem.m
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHTabBarItem.h"

@implementation LHHTabBarItem

- (id)initWithTitle:(NSString *)title selectedImage:(UIImage *)selectedImage unselectedImage:(UIImage *)unselectedImage {
    self = [super init];
    if (self) {
        self.title = title;
        self.selectedImage = selectedImage;
        self.unselectedImage = unselectedImage;
    }
    return self;
}

@end
