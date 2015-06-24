//
//  HomePageButtonView.m
//  PetShop
//
//  Created by weijuanmin on 15-6-12.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "HomePageButtonView.h"

@implementation HomePageButtonView

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
        UIView *containerView = [[[UINib nibWithNibName:@"HomePageButtonView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}

- (IBAction)clickedBt:(id)sender {
    UIButton *bt = (UIButton*)sender;
    NSInteger index = bt.tag;
    [_delegate clickedBtAction:index];
}
@end
