//
//  CommendSuppView.m
//  PetShop
//
//  Created by lyk on 15/8/8.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CommendSuppView.h"

@implementation CommendSuppView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"CommendSuppView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}
-(void)loadSubView
{
    int index = (int)self.tag;
    int yuIndex = index%3;
    int chuIndex = index/3;
    if (chuIndex==0) {
        if (yuIndex==0) {
            leftLine.hidden = YES;
            rightLine.hidden = NO;
            
        }else if(yuIndex ==2)
        {
            leftLine.hidden = NO;
            rightLine.hidden = YES;
        }else
        {
            leftLine.hidden = NO;
            rightLine.hidden = NO;
        }
        topLine.hidden = YES;
    }else
    {
        if (yuIndex==0) {
            leftLine.hidden = YES;
            rightLine.hidden = NO;
            
        }else if(yuIndex ==2)
        {
            leftLine.hidden = NO;
            rightLine.hidden = YES;
        }else
        {
            leftLine.hidden = NO;
            rightLine.hidden = NO;
        }
        topLine.hidden = NO;
        bottomLine.hidden = YES;
    }
}
@end
