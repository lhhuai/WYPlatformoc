//
//  LHHTabBarItem.h
//  WYPlatformoc
//
//  Created by seaphy on 16/7/27.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHHTabBarItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, strong) UIImage *unselectedImage;

- (id)initWithTitle:(NSString *)title selectedImage:(UIImage *)selectedImage unselectedImage:(UIImage *)unselectedImage;

@end
