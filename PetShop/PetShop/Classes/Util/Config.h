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




#define kDeviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#define kNavigationBgColor [UIColor colorWithRed:248.0/255.0 green:28/255.0 blue:102/255.0 alpha:1.0]
#define Rgb(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define topBarheight      ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?64:44)