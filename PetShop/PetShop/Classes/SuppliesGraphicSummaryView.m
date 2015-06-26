//
//  SuppliesGraphicSummaryView.m
//  PetShop
//
//  Created by wjm on 15/6/24.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "SuppliesGraphicSummaryView.h"
#import "UIButton+Select.h"

@implementation SuppliesGraphicSummaryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *containerView = [[[UINib nibWithNibName:@"SuppliesGraphicSummaryView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}
#pragma mark - 收藏触发事件
- (IBAction)collectedAction:(id)sender {
    NSLog(@"collectedAction");
    UIButton_Select *bt = (UIButton_Select*)sender;
    BOOL isSelected = bt.showColor;
    NSString *string = nil;
    if (!isSelected) {
        string = @"收藏成功";
    }else
    {
        string = @"收藏失败";
    }
    self.colletedOrCancel(string);
    bt.showColor = !isSelected;
}
@end
