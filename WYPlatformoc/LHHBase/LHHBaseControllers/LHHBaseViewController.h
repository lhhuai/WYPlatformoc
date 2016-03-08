//
//  LHHBaseViewController.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHHBarButtonItem.h"
#import "LHHAlertView.h"

@interface LHHBaseViewController : UIViewController <LHHBarButtonItemDelegate>

@property (nonatomic, strong) LHHAlertView *hud;

- (void)dismiss;

@end
