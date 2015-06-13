//
//  BannerView.m
//  PetShop
//
//  Created by wjm on 15/6/11.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "BannerView.h"
#define kScrollViewTag 5

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
    selectScrollView.tag = kScrollViewTag;
    
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
-(void)adaperScrollview:(CGRect)frame
{
    UIScrollView *scrollView = (UIScrollView *)[self viewWithTag:kScrollViewTag];
    //适配滚动视图的大小
    CGRect tframe = scrollView.frame;
    tframe.size.height = frame.size.height;
    tframe.origin.y = 50;
    scrollView.frame = tframe;
    //适配contentSize的大小
    CGSize contenSize = scrollView.contentSize;
    contenSize.height = frame.size.height;
    scrollView.contentSize = contenSize;
    //适配滚动视图子视图的大小
    for (UIView *view in [scrollView subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            tframe = view.frame;
            tframe.size.height = frame.size.height;
            view.frame = tframe;
            
        }
    }
}

- (IBAction)leftOrRightAction:(id)sender {
    UIButton *bt = (UIButton*)sender;
     UIScrollView *scrollView = (UIScrollView *)[self viewWithTag:kScrollViewTag];
     CGPoint point = scrollView.contentOffset;
    switch (bt.tag) {
        case 1://点击向左按钮
            if (pageControl.currentPage>0) {
                pageControl.currentPage = pageControl.currentPage-1;
                point.x = point.x -kWidth;
            }
            break;
        case 2://点击向右按钮
            if (pageControl.currentPage<pageControl.numberOfPages-1) {
                pageControl.currentPage = pageControl.currentPage+1;
                point.x = point.x +kWidth;
            }
            break;
            
        default:
            break;
    }
    [scrollView setContentOffset:point animated:YES];
    
}
@end
