//
//  Config.h
//  PetShop
//
//  Created by wjm on 15/6/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#ifndef PetShop_Config_h
#define PetShop_Config_h
#endif

#import "Util.h"
#import "MBProgressHUD.h"


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define kDeviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define kIphone5  [UIScreen mainScreen].bounds.size.height == 568
#define kIphone4  [UIScreen mainScreen].bounds.size.height == 480
#define kIphone6  [UIScreen mainScreen].bounds.size.height == 667
#define kIphone6plus [UIScreen mainScreen].bounds.size.height == 960

#define autoSizeScaleX kIphone6?1.171875:(kIphone6plus?1.29375:1)
#define autoSizeScaleY kIphone6?1.17429577:(kIphone6plus?1.2957:1)

#define kNavigationBgColor [UIColor colorWithRed:248.0/255.0 green:28/255.0 blue:102/255.0 alpha:1.0]
#define Rgb(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define topBarheight      ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?64:44)

#define HUDTAG 100000