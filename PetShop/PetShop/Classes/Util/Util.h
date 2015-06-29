//
//  Util.h
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Util : NSObject
/**
 根据数组中的类名称，title，image 生成tabbar的Viewcontrollers
 */
+(NSMutableArray*)generateViewControllerByName:(NSDictionary*)classInfoDic;

/**
 根据颜色获取对应色值的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 获取当前年、月、日、周
 */
+ (NSDictionary*)getCurrentMonth;

/**
 获取指定月份的天数
 */
+(int)howManyDaysInThisMonth:(int)year month:(int)month;

/**
 获取document的路径
 */
+(NSString*)documentPath;

/**
 复制原文件到指定目录
 */
+(BOOL)copyFile:(NSString*)originalPath To:(NSString*)targetPath;

/**
 用户的数据库文件路径
 */
+(NSString*)getSQLitePath;

#pragma mark - 自定义的Point Size Rect
/**
 自定义的rect
 */
+ (CGRect)myCGRectMake:(float)x andY:(float)y Width:(float)width Height:(float) height;
/**
 自定义的Size
 */
+(CGSize)myCGSizeMake:(float)width Height:(float)height;
/**
 自定义的Point
 */
+(CGPoint)myCGPoint:(float)x AndY:(float)y;
+(CGFloat)myYOrHeight:(float)var;
+(CGFloat)myXOrWidth:(float)var;
@end
