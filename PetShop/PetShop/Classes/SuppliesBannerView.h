//
//  SuppliesBannerView.h
//  PetShop
//
//  Created by wjm on 15/6/23.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuppliesBannerView : UIView<UIScrollViewDelegate>
{
    
    IBOutlet UIScrollView *bannerScroll;
    IBOutlet UIPageControl *bannerPage;
}
/**
 加载scrollView上的图片
 */
-(void)loadScrollViewSubView:(NSArray*)dataArray;
@end
