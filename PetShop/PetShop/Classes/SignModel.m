//
//  SignModel.m
//  PetShop
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SignModel.h"

@implementation SignModel
//单实例
+(SignModel*)sharedInstance
{
    static SignModel *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    
    return instance;
}
//插入新数据
-(void)updateSign:(NSDictionary*)signDic
{
    NSString *dbPath = [Util getSQLitePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"could not open db.");
    }
    [db setShouldCacheStatements:YES];
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [queue inTransaction:^(FMDatabase *db,BOOL *rollback){
        BOOL isSuccess = [db executeUpdate:@"insert into Sign (year,month,day,userId) values(?,?,?,?)",[signDic objectForKey:YEAR],[signDic objectForKey:MONTH],[signDic objectForKey:DAY] ,[signDic objectForKey:USERID] ];
        if (!isSuccess) {
            NSLog(@"插入失败");
            *rollback = YES;
            return ;
        }
    }];
    [db close];
   
}
// 查询数据
-(NSMutableArray*)getSignDateByMonth:(int)month AndYear:(int)year AndUser:(int)userId
{
    NSString *dbPath = [Util getSQLitePath];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        NSLog(@"could not open db");
    }
    [db setShouldCacheStatements:YES];
    
    NSMutableArray *dateArray = [[NSMutableArray alloc] initWithCapacity:31];
    //数组中每个位置存入空对象
    for (int i =0; i< 31; i++) {
        [dateArray addObject:[NSNumber numberWithInt:0]];
    }
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    [queue inDatabase:^(FMDatabase *db){
        FMResultSet *rs = [db executeQuery:@"select * from Sign where year = ? and month = ? and userId = ?",[NSNumber numberWithInt:year],[NSNumber numberWithInt:month],[NSNumber numberWithInt:userId]];
        while ([rs next]) {
            int day = [rs intForColumn:DAY];
            [dateArray insertObject:[NSNumber numberWithInt:day] atIndex:day-1];
        }
        [rs close];
    }];
    return dateArray;
    
}
@end
