//
//  LHHActionSheet.h
//  WYPlatformoc
//
//  Created by seaphy on 16/3/4.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SeletedButtonIndex)(NSInteger Buttonindex);
typedef void(^CompleteAnimationBlock)(BOOL Complete);

@interface LHHActionSheet : UIView

@property (nonatomic,strong) SeletedButtonIndex ButtonIndex;

-(instancetype) initWithCancelStr:(NSString *)str otherButtonTitles:(NSArray<NSString *> *)titles attachTitle:(NSString *)attachTitle;

-(void)buttonIndex:(SeletedButtonIndex)buttonIndex;

-(void)changeTitleColor:(UIColor *)color andIndex:(NSInteger)index;

@end
