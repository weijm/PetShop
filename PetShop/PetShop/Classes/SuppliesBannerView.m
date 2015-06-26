//
//  SuppliesBannerView.m
//  PetShop
//
//  Created by wjm on 15/6/23.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SuppliesBannerView.h"

@implementation SuppliesBannerView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"SuppliesBannerView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}
//加载scrollView上的图片
-(void)loadScrollViewSubView:(NSArray*)dataArray
{
    NSInteger imageCount = dataArray.count;
    int scrollAnchor = -kWidth;
    for (int i =0; i < imageCount; i++) {
        scrollAnchor += kWidth;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollAnchor, 0, kWidth, self.frame.size.height)];
        
        imageView.image = [UIImage imageNamed:dataArray[i]];
        imageView.clipsToBounds = NO;
        imageView.tag = i;
        [bannerScroll addSubview:imageView];
    }
    bannerScroll.contentSize = CGSizeMake(scrollAnchor+kWidth, self.frame.size.height);
    bannerScroll.pagingEnabled=YES;
    bannerPage.numberOfPages = imageCount;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchImageInScrollView:)];
    [bannerScroll addGestureRecognizer:tap];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    float wid ;
    wid = _scrollView.contentOffset.x;
    bannerPage.currentPage = round(wid/kWidth);
    
}
#pragma mark - 点击滚动视图上的各张图片触发的事件
-(void)touchImageInScrollView:(UITapGestureRecognizer*)sender
{
    CGPoint point = [sender locationInView:bannerScroll];
    float pointX = point.x;
    int pageIndex = pointX/kWidth;
    NSLog(@"pageIndex == %d",pageIndex);
    if ([_delegate respondsToSelector:@selector(clickedBannerImage:)]) {
        [_delegate clickedBannerImage:pageIndex];
    }
}
@end
