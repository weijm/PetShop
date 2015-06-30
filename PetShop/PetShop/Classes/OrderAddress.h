//
//  OrderAddress.h
//  PetShop
//
//  Created by wjm on 15/6/29.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

#define PERSONALNAME @"personalName"
#define PHONE @"phone"
#define AREA @"area"
#define ADDRESS @"address"
#define ISDEFAULT @"isDefault"
#define USERID @"userId"  //关联user
#define ORDERID @"id"
@interface OrderAddress : NSObject
/**
 单实例
 */
+(instancetype)sharedInstance;
/**
 插入新的数据
 */
-(void)insertData:(NSDictionary*)dictionary;
/**
 更新数据
 */
-(void)updateData:(NSDictionary*)dictionary;
/**
 获取所有数据
 */
-(NSMutableArray*)getAllData;
/**
 删除数据
 */
-(void)deleteData:(int)dataId;
@end
