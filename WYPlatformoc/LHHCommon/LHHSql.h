//
//  LHHSql.h
//  WYPlatformoc
//
//  Created by seaphy on 16/9/12.
//  Copyright © 2016年 seaphy. All rights reserved.
//

#ifndef LHHSql_h
#define LHHSql_h

static NSString * const createArticleSQL = @"CREATE TABLE IF NOT EXISTS article (id INT, title VARCHAR, authorname VARCHAR, categoryname VARCHAR)";

static NSString * const saveArticleSQL   = @"INSERT INTO article VALUES (?, ?, ?, ?)";
static NSString * const deleteArticleSQL = @"DELETE FROM article";
static NSString * const selectArticleSQL = @"SELECT * FROM article";


#endif /* LHHSql_h */
