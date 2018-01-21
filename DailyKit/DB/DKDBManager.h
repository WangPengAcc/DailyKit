//
//  DKDBManager.h
//  DailyKit
//
//  Created by 王鹏 on 2017/12/6.
//  Copyright © 2017年 WANGPENG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DKDBManager : NSObject

/**
 *  Setting up the database file
 */
+ (void)setDataBaseName:(NSString *)name;

/**
 *  Use @sql create
 */
+ (BOOL)createTable:(NSString *)sql;

/**
 *  Use @sql insert
 */
+ (BOOL)insert:(NSString *)sql;

/**
 *  Insert or replace @keyValues into @table
 */
+ (BOOL)insert:(NSString *)table keyValues:(NSDictionary *)keyValues;

/**
 *  Insert @keyValues into @table
 *
 *  @param replace    if have is the same record, whether you need to replace
 */
+ (BOOL)insert:(NSString *)table keyValues:(NSDictionary *)keyValues replace:(BOOL)replace;

/**
 *  Use @sql Update
 */
+ (BOOL)update:(NSString *)sql;

/**
 *  Use @keyValues updated @table
 *
 *  @warning the default where is "id=?", so @keyValues must include "id"
 */
+ (BOOL)update:(NSString *)table keyValues:(NSDictionary *)keyValues;

/**
 *  If the @where are met, use @keyValues updated @table
 */
+ (BOOL)update:(NSString *)table keyValues:(NSDictionary *)keyValues where:(NSString *)where;

/**
 *  Delete from @table
 */
+ (BOOL)remove:(NSString *)table;

/**
 *  Delete from @table where id=@id_
 */
+ (BOOL)removeById:(NSString *)id_ from:(NSString *)table;

/**
 *  Delete from @table @where
 */
+ (BOOL)remove:(NSString *)table where:(NSString *)where;

/**
 *  Select * from @table
 */
+ (NSMutableArray *)query:(NSString *)table;

/**
 *  Select * from @table where id=@id_
 */
+ (NSDictionary *)queryById:(NSString *)id_ from:(NSString *)table;

/**
 *  Select * from @table @where
 */
+ (NSMutableArray *)query:(NSString *)table where:(NSString *)where, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Select count(id) from @table
 */
+ (NSInteger)totalRowOfTable:(NSString *)table;

/**
 *  Select count(id) from @table @where
 */
+ (NSInteger)totalRowOfTable:(NSString *)table where:(NSString *)where;

/**
 *  batch execute @sqls
 *
 *  @param useTransaction    whether to use transaction
 */
+ (BOOL)executeBatch:(NSArray *)sqls useTransaction:(BOOL)useTransaction;

/**
 通过fileName.sql建表

 @param fileName 文件名 = 表名
 */
+ (void)createTableBySQLFile:(NSString *)fileName;

@end
