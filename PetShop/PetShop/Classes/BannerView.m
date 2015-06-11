//
//  BannerView.m
//  PetShop
//
//  Created by wjm on 15/6/11.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "BannerView.h"

@implementation BannerView


#pragma mark- 加载图片和数据
-(void)loadImageAndData:(NSArray*)dataArray
{
    
    UIScrollView *selectScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, self.frame.size.height)];
    selectScrollView.backgroundColor=[UIColor clearColor];
    selectScrollView.delegate=self;
    selectScrollView.decelerationRate=0.5;
    selectScrollView.showsHorizontalScrollIndicator=NO;
    selectScrollView.pagingEnabled=YES;
    
    NSInteger imageCount = dataArray.count;
    int scrollAnchor = -kWidth;
    for (int i =0; i < imageCount; i++) {
        scrollAnchor += kWidth;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollAnchor, 0, kWidth, selectScrollView.frame.size.height)];
        
        imageView.image = [UIImage imageNamed:dataArray[i]];
        imageView.clipsToBounds = NO;
        imageView.tag = i;
        [selectScrollView addSubview:imageView];
    }
    selectScrollView.contentSize = CGSizeMake(scrollAnchor+kWidth, self.frame.size.height);
   
    pageControl.numberOfPages = imageCount;
    [self insertSubview:selectScrollView belowSubview:pageControl];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    float wid ;
    wid = _scrollView.contentOffset.x;
    pageControl.currentPage = round(wid/kWidth);
    
}
@end
