//
//  CustomSegmentView.m
//  PetShop
//
//  Created by wjm on 15/6/17.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import "CustomSegmentView.h"

@implementation CustomSegmentView

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
        UIView *containerView = [[[UINib nibWithNibName:@"CustomSegmentView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        containerView.frame = newFrame;
        [self addSubview:containerView];
    }
    return self;
}
//加载button上的标题，显示或隐藏横竖线
-(void)loadButtonView
{
    NSInteger  tag = self.tag;
    self.backgroundColor = [UIColor whiteColor];
    switch (tag) {
        case 1:
            _hLine.hidden = NO;
            self.backgroundColor = Rgb(234, 234, 234);
            break;
        case 2:
            [segmentBt setTitle:@"价格排序" forState:UIControlStateNormal];
            break;
        case 3:
            [segmentBt setTitle:@"销量排序" forState:UIControlStateNormal];
            vLine.hidden = YES;
            break;
            
        default:
            break;
    }
}
//点击按钮的触发事件
- (IBAction)clickedCustomSegmentBt:(id)sender {
    NSInteger viewTag = self.tag;
    _hLine.hidden = NO;
    self.backgroundColor = Rgb(234, 234, 234);
    if ([_delegate respondsToSelector:@selector(ClickBtByTag:)]) {
        
        [_delegate ClickBtByTag:viewTag];
        _isShowCoverView = !_isShowCoverView;
    }
}
@end
