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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"BannerView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}
#pragma mark- 加载图片和数据
-(void)loadImageAndData:(NSArray*)dataArray
{
    NSInteger imageCount = dataArray.count;
    int scrollAnchor = -kWidth;
    for (int i =0; i < imageCount; i++) {
        scrollAnchor += kWidth;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollAnchor, 0, kWidth, self.frame.size.height)];
        
        imageView.image = [UIImage imageNamed:dataArray[i]];
        imageView.clipsToBounds = NO;
        imageView.tag = i;
        [bannerScrollView addSubview:imageView];
    }
    bannerScrollView.contentSize = CGSizeMake(scrollAnchor+kWidth, self.frame.size.height);
   
    pageControl.numberOfPages = imageCount;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    float wid ;
    wid = _scrollView.contentOffset.x;
    pageControl.currentPage = round(wid/kWidth);
    
}

- (IBAction)leftOrRightAction:(id)sender {
    UIButton *bt = (UIButton*)sender;
     CGPoint point = bannerScrollView.contentOffset;
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
    [bannerScrollView setContentOffset:point animated:YES];
    
}
@end
