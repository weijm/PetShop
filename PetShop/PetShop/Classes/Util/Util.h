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
@end
