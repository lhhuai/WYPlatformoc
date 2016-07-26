//
//  UIImage+WYAddition.m
//  WYLibraries
//
//  Created by seaphy on 16/5/17.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "UIImage+WYAddition.h"

@implementation UIImage (WYAddition)

+ (UIImage *)wy_imageWithColor:(UIColor *)color size:(CGSize)size {
    return [self wy_imageWithColor:color size:size opaque:NO];
}

+ (UIImage *)wy_imageWithColor:(UIColor *)color size:(CGSize)size opaque:(BOOL)opaque {
    float width = size.width;
    float height = size.height;
    
    UIGraphicsBeginImageContextWithOptions(size, opaque, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, width, height));
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
