//
//  SignModel.h
//  PetShop
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

#define YEAR  @"year"
#define MONTH @"month"
#define DAY   @"day"
#define USERID @"userId"

@interface SignModel : NSObject
@property (nonatomic) int year; //年
@property (nonatomic) int month;
@property (nonatomic) int day;
@property (nonatomic) int userId;

/**
 单实例
 */
+(SignModel*)sharedInstance;

/**
 插入新数据
 */
-(void)updateSign:(NSDictionary*)signDic;

/**
 查询数据
 */
-(NSMutableArray*)getSignDateByMonth:(int)month AndYear:(int)year AndUser:(int)userId;

@end
