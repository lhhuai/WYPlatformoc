//
//  NSData+WYAddition.h
//  WYLibraries
//
//  Created by seaphy on 16/5/16.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (WYAddition)

- (NSString *)wy_hexRepresentation;

- (NSData *)wy_dataByEncryptingUsingMD5;

@end
