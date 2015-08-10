//
//  CommunityHeaderView.m
//  PetShop
//
//  Created by lyk on 15/8/9.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CommunityHeaderView.h"

@implementation CommunityHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"CommunityHeaderView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}

- (IBAction)selectedAction:(id)sender {
    UIButton *bt = (UIButton*)sender;
    if (bt.tag==1) {//互动区
        selectedLine1.hidden = NO;
        selectedLine2.hidden = YES;
    }else
    {//相亲区
        selectedLine1.hidden = YES;
        selectedLine2.hidden = NO;
    
    }
}
@end
