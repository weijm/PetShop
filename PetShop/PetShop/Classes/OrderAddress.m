//
//  OrderAddress.m
//  PetShop
//
//  Created by wjm on 15/6/29.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "OrderAddress.h"

@implementation OrderAddress
//单实例
+(instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id instance = nil;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}
// 插入新的数据
-(void)insertData:(NSDictionary*)dictionary
{
    NSString *dbPath = [Util getSQLitePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"db not open");
    }
    [db setShouldCacheStatements:YES];
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL isSuccess;
        isSuccess = [db executeUpdate:@"insert into OrderAddress (personalName,phone,area,address,isDefault,userId) values(?,?,?,?,?,?)",[dictionary objectForKey:PERSONALNAME],[dictionary objectForKey:PHONE],[dictionary objectForKey:AREA],[dictionary objectForKey:ADDRESS],[dictionary objectForKey:ISDEFAULT],[dictionary objectForKey:USERID]];;
        if (!isSuccess) {
            NSLog(@"插入失败");
            *rollback = YES;
            return ;
        }
    }];
    [db close];
    
}
//更新数据
-(void)updateData:(NSDictionary*)dictionary
{
    NSString *dbPath = [Util getSQLitePath];
    FMDatabase *db =[FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"db not open");
    }
    [db setShouldCacheStatements:YES];
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL isSuccess = [db executeUpdate:@"update OrderAddress set personalName=?,phone=?,area=?,address=?,isDefault=? where id =?",[dictionary objectForKey:PERSONALNAME],[dictionary objectForKey:PHONE],[dictionary objectForKey:AREA],[dictionary objectForKey:ADDRESS],[dictionary objectForKey:ISDEFAULT],[dictionary objectForKey:ORDERID]];
        if (!isSuccess) {
            NSLog(@"插入失败");
            *rollback = YES;
            return ;
        }

    }];
}
//获取所有数据
-(NSMutableArray*)getAllData
{
    NSString *dbPath = [Util getSQLitePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"db not open");
    }
    [db setShouldCacheStatements:YES];
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"select * from OrderAddress ORDER BY id DESC"];
        while ([rs next]) {
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            [dictionary setObject:[rs stringForColumn:PERSONALNAME] forKey:PERSONALNAME];
            [dictionary setObject:[rs stringForColumn:PHONE] forKey:PHONE];
            [dictionary setObject:[rs stringForColumn:AREA] forKey:AREA];
            [dictionary setObject:[Util checkString:[rs stringForColumn:ADDRESS]] forKey:ADDRESS];
            [dictionary setObject:[NSNumber numberWithInt:[rs intForColumn:ISDEFAULT]] forKey:ISDEFAULT];
            [dictionary setObject:[NSNumber numberWithInt:[rs intForColumn:USERID]] forKey:USERID];
            [dictionary setObject:[NSNumber numberWithInt:[rs intForColumn:ORDERID]] forKey:ORDERID];
            [resultArray addObject:dictionary];
        }
        [rs close];
    }];
    return resultArray;
}
//删除数据
-(void)deleteData:(int)dataId
{
    NSString *dbPath = [Util getSQLitePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"db not open ");
    }
    
    [db setShouldCacheStatements:YES];
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        BOOL isSuccess = [db executeUpdate:@"delete from OrderAddress where id = ?",[NSNumber numberWithInt:dataId]];
        if (!isSuccess) {
            NSLog(@"删除失败");
            *rollback = YES;
            return ;
        }
    }];
}
// 根据id获取订单地址信息
-(NSDictionary*)getDataById:(int)orederAddressId
{
    NSString *dbPath = [Util getSQLitePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"db not open");
    }
    [db setShouldCacheStatements:YES];
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [queue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *rs;
        if (orederAddressId == 0) {//新建的地址
            rs = [db executeQuery:@"select * from OrderAddress ORDER BY id DESC"];
        }else
        {//查询的地址
            rs = [db executeQuery:@"select * from OrderAddress where id = ?",[NSNumber numberWithInt:orederAddressId]];
        }
        if ([rs next]) {
            [dictionary setObject:[rs stringForColumn:PERSONALNAME] forKey:PERSONALNAME];
            [dictionary setObject:[rs stringForColumn:PHONE] forKey:PHONE];
            [dictionary setObject:[rs stringForColumn:AREA] forKey:AREA];
            [dictionary setObject:[Util checkString:[rs stringForColumn:ADDRESS]] forKey:ADDRESS];
            [dictionary setObject:[NSNumber numberWithInt:[rs intForColumn:ISDEFAULT]] forKey:ISDEFAULT];
            [dictionary setObject:[NSNumber numberWithInt:[rs intForColumn:USERID]] forKey:USERID];
            [dictionary setObject:[NSNumber numberWithInt:[rs intForColumn:ORDERID]] forKey:ORDERID];
        }
        [rs close];
    }];
    return dictionary;

}
@end
