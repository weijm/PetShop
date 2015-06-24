//
//  Util.m
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "Util.h"



@implementation Util
// 根据数组中的类名称，title，image 生成tabbar的Viewcontrollers
+(NSMutableArray*)generateViewControllerByName:(NSDictionary*)classInfoDic
{
    NSArray *titleArray = [classInfoDic objectForKey:@"title"];
    NSArray *classArray = [classInfoDic objectForKey:@"name"];
    NSArray *imageArray = [classInfoDic objectForKey:@"image"];
    NSMutableArray *vcArray = [[NSMutableArray alloc] initWithCapacity:titleArray.count];
    for (int i =0; i < [classArray count]; i++) {
        NSString *classString = [NSString stringWithFormat:@"%@ViewController",classArray[i]];
        //创建控制器
        UIViewController *vc = [[NSClassFromString(classString) alloc] init];
        //设置title
        if (titleArray.count>0) {
            vc.title = titleArray[i];
            
        }
        //设置image
        if (imageArray.count>0) {
            vc.tabBarItem.image = [UIImage imageNamed:imageArray[i]];
        }
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:vc];
        if (kDeviceVersion >=7.0) {
            //设置navigation的背景
            [navigation.navigationBar setBarTintColor:kNavigationBgColor];
            //设置navigation的title颜色
            NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
            textAttrs[NSForegroundColorAttributeName]=[UIColor whiteColor];
            [navigation.navigationBar setTitleTextAttributes:textAttrs];
        }
        [vcArray addObject:navigation];
    }
    return vcArray;
}
//根据颜色获取对应色值的图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
//获取当前年、月、日、周
+ (NSDictionary*)getCurrentMonth
{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit ;
    comps = [calendar components:unitFlags fromDate:date];
    int week = [comps weekday];
    int year=[comps year];
    int month = [comps month];
    int day = [comps day];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:year],@"year",[NSNumber numberWithInt:month],@"month",[NSNumber numberWithInt:day],@"day",[NSNumber numberWithInt:week],@"week", nil];
    return dictionary;
}
//获取指定月份的天数
+(int)howManyDaysInThisMonth:(int)year month:(int)imonth {
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12))
        return 31;
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11))
        return 30;
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0)
        return 29;
    if(year%100 == 0)
        return 28;
    return 29;
}
#pragma mark - 文件的相关操作
//document的路径
+(NSString*)documentPath
{
    NSString *docPath = nil;
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docPath = [searchPaths firstObject];
    return docPath;
}
// 复制原文件到指定目录
+(BOOL)copyFile:(NSString*)originalPath To:(NSString*)targetPath
{
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSError *error;
    if (![filemanager copyItemAtPath:originalPath toPath:targetPath error:&error]) {
        NSLog(@"copy file error %@",[error localizedDescription]);
        return NO;
    }
    return YES;
}
// 用户的数据库文件路径
+(NSString*)getSQLitePath
{
    NSString *dbPath = [NSString stringWithFormat:@"%@/PetDB.sqlite",[self documentPath]];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    if (![filemanager fileExistsAtPath:dbPath]) {
        NSString *bundelPath = [[NSBundle mainBundle] pathForResource:@"PetDB" ofType:@"sqlite"];
        if (![self copyFile:bundelPath To:dbPath]) {
            NSLog(@"getSQLitePath copy file error");
        }
    }
    return dbPath;
}
#pragma mark - 自定义的Point Size Rect
+ (CGRect)myCGRectMake:(float)x andY:(float)y Width:(float)width Height:(float) height
{
    CGRect rect;
    rect.origin.x = x * autoSizeScaleX;
    rect.origin.y = y * autoSizeScaleY;
    rect.size.width = width * autoSizeScaleX;
    rect.size.height = height * autoSizeScaleY;
    return rect;
}
+(CGSize)myCGSizeMake:(float)width Height:(float)height
{
    CGSize size;
    NSLog(@"width == %f,height == %f",width,height);
    NSLog(@"autoSizeScaleY == %f",autoSizeScaleY);
    NSLog(@"in height == %f",height*autoSizeScaleY);
    size.width = width * autoSizeScaleX;
    size.height = height * autoSizeScaleY;
    NSLog(@"size == %@",NSStringFromCGSize(size));
    return size;
}
+(CGPoint)myCGPoint:(float)x AndY:(float)y
{
    CGPoint point;
    point.x = x *autoSizeScaleX;
    point.y = y *autoSizeScaleY;
    return point;
}
+(CGFloat)myYOrHeight:(float)var
{
    float var1 = autoSizeScaleY;
    float newVar = var *var1;
    return newVar;
}
@end
