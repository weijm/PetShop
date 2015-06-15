//
//  BannerView.h
//  PetShop
//
//  Created by wjm on 15/6/11.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface BannerView : UIView<UIScrollViewDelegate>
{
    //banner上的标识页码的
    __weak IBOutlet UIPageControl *pageControl;
    
}
//加载图片和数据
-(void)loadImageAndData:(NSArray*)dataArray;
//适配scrollView的大小
-(void)adaperScrollview:(CGRect)frame;

- (IBAction)leftOrRightAction:(id)sender;

@end
