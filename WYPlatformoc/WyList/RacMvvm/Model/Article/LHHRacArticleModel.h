//
//  LHHRacArticleModel.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#import "LHHRacBaseModel.h"

@interface LHHRacArticleModel : LHHRacBaseModel

@property (nonatomic, copy) NSString *articleId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *authorName;
@property (nonatomic, copy) NSString *categoryName;

@end
