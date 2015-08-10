//
//  SuppliesViewController.h
//  宠物用品首页
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSegmentView.h"
#import "SuppliesBannerView.h"

@interface SuppliesViewController : UIViewController<CustomSegmentViewDelegate,UITableViewDataSource,UITableViewDelegate,SuppliesBannerViewDelegate>
{
    //横向滚动视图的背景视图
    IBOutlet UIView *bannerBg;
    //首行点击按钮的背景视图
    IBOutlet UIView *segmentView;
}
@property (nonatomic) BOOL isPurchase;
@end
