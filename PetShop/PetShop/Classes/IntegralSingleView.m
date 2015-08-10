//
//  IntegralView.m
//  PetShop
//
//  Created by lyk on 15/8/10.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "IntegralSingleView.h"

@implementation IntegralSingleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"IntegralSingleView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        containerView.layer.borderWidth =1;
        containerView.layer.borderColor = [[UIColor grayColor] CGColor];
        [self addSubview:containerView];
    }
    return self;
}


@end
