//
//  NSString+WYChecker.h
//  WYLibraries
//
//  Created by seaphy on 16/5/13.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WYChecker)

- (BOOL)isValidateMobileNumber;

- (BOOL)isValidateTelNumber;

- (BOOL)isValidateEmail;

- (BOOL)isValidateUrl;

- (BOOL)isChinese;

- (BOOL)isValidateIDCardNumber;

- (BOOL)verifyIDCardNumber;

@end
