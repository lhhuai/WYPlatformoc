//
//  UIImage+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WYAddition)

+ (UIImage *)wy_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)wy_imageWithColor:(UIColor *)color size:(CGSize)size opaque:(BOOL)opaque;

@end
