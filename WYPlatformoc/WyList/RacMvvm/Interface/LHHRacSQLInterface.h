//
//  LHHRacSQLInterface.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LHHRacSQLInterface <NSObject>

@optional
- (BOOL)saveData;
- (void)loadData;
- (BOOL)deleteData;
- (BOOL)updateData;

@end
